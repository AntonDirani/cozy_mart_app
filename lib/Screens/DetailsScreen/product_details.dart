import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:cozy_mart_0/Screens/DetailsScreen/detail_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;

  const DetailsScreen({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      //actionsIconTheme: IconThemeData(color: Colors.white),
      title: Text(
        product!.title,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple,
    );
  }
}
