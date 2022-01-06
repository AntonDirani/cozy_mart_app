//import 'dart:html';
import 'dart:io';
import 'package:cozy_mart_0/Screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cozy_mart_0/Providers/product_provider.dart';

class UserProductItem extends StatelessWidget {
  final String? id;
  final String title;
  final File? image;

  UserProductItem({required this.id, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: Container(
        child: image != null ? Image.file(image!) : Text('No Image'),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                //print('$id');
                Navigator.of(context)
                    .pushNamed(AddProduct.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Confirm'),
                            content: Text(
                              'Do you want to remove this product?',
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  Provider.of<Products>(context, listen: false)
                                      .deleteProduct(id!);
                                  Navigator.of(ctx).pop(true);
                                },
                              ),
                            ],
                          ));
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(
                        'Deleting failed!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
