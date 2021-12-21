import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  late final int id = random.nextInt(100);
  late final String title;
  late final int quantity;
  late final String phoneNumber;
  late Image image; //File
  late final DateTime expDate;
  late final String category;
  late double price; //Price

  Random random = Random();

  Product(
      {required this.title,
      required this.phoneNumber,
      required this.quantity,
      //required this.expDate,
      //required this.category,
      required this.price});
}

enum Sale { ten, twenty, thirty, forty, fifty, sixty, seventy, eighty }

class Price {
  late double price;
  late String before30;
  late String before15;
  late String under15;
  Price(
      {required this.before15, required this.before30, required this.under15});
}

class Products with ChangeNotifier {
  List<Product> productsList = [
    Product(
        title: 'Shirt', phoneNumber: '0936189449', quantity: 7, price: 50.0),
    Product(
        title: 'Shirt', phoneNumber: '0936189449', quantity: 7, price: 50.0),
    Product(
        title: 'Shirt', phoneNumber: '0936189449', quantity: 7, price: 50.0),
    Product(
        title: 'Shirt', phoneNumber: '0936189449', quantity: 7, price: 50.0),
  ];

  // late File image;
  List get_productsList() {
    return productsList;
  }

  void addProduct(
      {required String title,
      required double price, //Price
      required int quantity,
      required String category,
      required DateTime expDate,
      required String phoneNumber}) {
    productsList.add(Product(
        title: title,
        phoneNumber: phoneNumber,
        quantity: quantity,
        // expDate: expDate,
        //category: category,
        price: price));
    notifyListeners();
  }
}
