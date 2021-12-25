import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Providers/product_provider.dart';
import 'package:cozy_mart_0/Screens/DetailsScreen/detail_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product? product;

  const DetailsScreen({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: const Color(0xFFBE93D4),
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        product!.title,
        style: TextStyle(fontSize: 30),
      ),
      backgroundColor: const Color(0xFFBE93D4),
    );
  }
}
