import 'package:cozy_mart_0/Components/user_product_item.dart';
import 'package:cozy_mart_0/Screens/add_product.dart';
import 'package:cozy_mart_0/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:http/http.dart' as http;
import 'all_products.dart';

class UserProductsScreen extends StatelessWidget {
  /*static const routeName = '/user-products';*/

  /*Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProducts();
  }*/
  /*Future<String> returnUserName()async{
    final  response = await http.get(Uri.parse('http://192.168.43.228:8000/api/user/ahmad@gmail.com'),headers: {
      'X-USER-TOKEN':'$UserHttpService.token1'
    });
    final decodedData = json.decode(response.body) as Map<String,List<dynamic>>;
    return decodedData ;
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
                id: productsData.productsList[i].id,
                title: productsData.productsList[i].title,
                image: productsData.productsList[i].image2,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
