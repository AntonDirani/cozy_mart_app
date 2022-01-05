import 'package:cozy_mart_0/Components/user_product_item.dart';
import 'package:cozy_mart_0/Screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cozy_mart_0/Providers/product_provider.dart';

import 'all_products.dart';

class UserProductsScreen extends StatelessWidget {
  /*static const routeName = '/user-products';*/

  /*Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }*/
  UserProductsScreen({required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddProduct.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(
        user: user,
      ),
      body: /* RefreshIndicator(
        //onRefresh: () => _refreshProducts(context),
        child:*/
          Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.productsList.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                productsData.productsList[i].id,
                productsData.productsList[i].title,
                'https://i.pinimg.com/originals/4e/be/50/4ebe50e2495b17a79c31e48a0e54883f.png',
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
