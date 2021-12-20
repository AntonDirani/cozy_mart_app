import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class Product {
  late final int id = random.nextInt(100);
  late final String title;
  late final int quantity;
  late final String phoneNumber;
  late File image;
  late final DateTime expDate;
  late final String category;
  late Price price;

  Random random = Random();

  Product(
      {required this.title,
      required this.phoneNumber,
      required this.quantity,
      required this.expDate,
      required this.category,
      required this.price});
}

enum Sale { ten, twenty, thirty, forty, fifty, sixty, seventy, eighty }

class Price {
  late String before30;
  late String before15;
  late String under15;
  Price(
      {required this.before15, required this.before30, required this.under15});
}

class Products with ChangeNotifier {
  List<Product> productList = [];
  late File image;
}
