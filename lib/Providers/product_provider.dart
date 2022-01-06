//import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product extends ChangeNotifier {
  late final String? id;
  late final String title;
  late final int quantity;
  late final String phoneNumber;
  late final String description;
  File? image; //File
  late final DateTime expDate;
  String? category = 'category1';
  late final double price; //Price

  Product();

  Product.a({
    required this.id,
    required this.description,
    required this.title,
    required this.phoneNumber,
    required this.quantity,
    required this.expDate,
    this.category,
    required this.price,
    required this.image,
  });
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
  List<Product> productsList = [];

  // late File image;

  Product findById(String id) {
    return productsList.firstWhere((prod) => prod.id == id);
  }

  void addProduct({required Product product}) {
    var productURL = 'http://192.168.43.228:8000/api/product';
    Dio().post(productURL, data: {
      "User_id": 3,
      "product_name": "iiiii4",
      "product_type": "kr",
      "product_quantity": 50,
      "product_expire_date": "2022/12/22",
      "product_price": 20,
      "product_desc": "productdescription"
    }).then((response) {
      print(response.data);
      final newProduct = Product.a(
        id: DateTime.now().toString(),
        description: product.description,
        title: product.title,
        phoneNumber: product.phoneNumber,
        quantity: product.quantity,
        expDate: product.expDate,
        category: product.category,
        price: product.price,
        image: product.image,
      );
      productsList.add(newProduct);
      notifyListeners();
    });
  }

  void updateProduct(String? id, Product newProduct) {
    final prodIndex = productsList.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      productsList[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    productsList.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
