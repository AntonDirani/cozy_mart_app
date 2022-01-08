//import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../main.dart';

class Product extends ChangeNotifier {
  late final String? id;
  late final String title;
  late final int? quantity;
  late final String? phoneNumber;
  late final String? description;
  File? image;
  String? image2;
  late String? expDate;
  String? category = 'category1';
  late final int? price; //Price

  Product();

  Product.a(
      {this.id,
      this.description,
      required this.title,
      this.phoneNumber,
      this.quantity,
      this.expDate,
      this.category,
      this.price,
      this.image,
      this.image2});
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

  Future<void> fetchProducts() async {
    try {
      final respone = await http.get(Uri.parse(url2));
      final decodedData = (json.decode(respone.body)) as List<dynamic>;
      final List<Product> loadedProducts = [];
      //print(decodedData);
      for (int i = 0; i <= decodedData.length - 1; i++) {
        // print(decodedData[i]['product_quantity']);
        loadedProducts.add(Product.a(
          id: decodedData[i]['product_id'].toString(),
          title: decodedData[i]['product_name'],
          quantity: decodedData[i]['product_quantity'],
          price: decodedData[i]['product_price'],
          //  // category: decodedData[i]['product_id'],
          description: decodedData[i]['product_desc'],
          expDate: decodedData[i]['product_expire_date'],
          image2: decodedData[i]['product_image'],
          //phoneNumber: decodedData[i]['product_id'],
        ));
        // print('success');
      }
      productsList = loadedProducts;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addProduct({required Product product}) async {
    try {
      final response = await Dio().post(url2, data: {
        "User_id": 1,
        "product_name": product.title,
        "product_quantity": product.quantity,
        "product_expire_date": product.expDate,
        "product_price": product.price,
        "product_desc": product.description,
        "product_image": product.image2
      });
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
        image2: product.image2,
        image: product.image,
      );
      productsList.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateProduct(String? id, Product newProduct) async {
    var urlUpdate = Uri.parse('$url2+/$id');
    final prodIndex = productsList.indexWhere((prod) => prod.id == id);
    try {
      await http.put(urlUpdate,
          body: json.encode({
            "User_id": 1,
            "product_name": newProduct.title,
            "product_quantity": newProduct.quantity,
            "product_price": newProduct.price,
            "product_desc": newProduct.description,
            "product_image": newProduct.image2
          }));
    } catch (er) {
      print(er);
    }
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
