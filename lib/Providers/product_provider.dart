//import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cozy_mart_0/user_controller.dart';
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
      final respone = await http.get(
        Uri.parse(url2),
        //options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-USER-TOKEN':
              'eyJlbWFpbCI6InBvQGhvdG1haWwuY29tIiwicGFzc3dvcmQiOiJwYXNzd29yZDIiLCJsb2dnZWRfYXQiOiIwOCAwMSAyMDIyIiwiZXhwaXJlZF9hdCI6IjA4IDAxIDIwMjIiLCJ1c2VyX3JvbGUiOiJ1c2VyIn0=',
        },
      );

      final decodedData = json.decode(respone.body) as List<dynamic>;
      final List<Product> loadedProducts = [];
      print(decodedData);
      for (int i = 0; i <= decodedData.length - 1; i++) {
        print(decodedData[i]['product_quantity']);
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
      final http.Response response = await http.post(Uri.parse(url2),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'X-USER-TOKEN':
                'eyJlbWFpbCI6InBvQGhvdG1haWwuY29tIiwicGFzc3dvcmQiOiJwYXNzd29yZDIiLCJsb2dnZWRfYXQiOiIwOCAwMSAyMDIyIiwiZXhwaXJlZF9hdCI6IjA4IDAxIDIwMjIiLCJ1c2VyX3JvbGUiOiJ1c2VyIn0='
          },
          body: json.encode({
            "product_name": product.title,
            "product_quantity": product.quantity,
            "product_expire_date": "2022/12/12",
            "product_price": 5,
            "list_discounts": [
              {"discount_percentage": 70, "date": "2022-01-06"},
              {"discount_percentage": 75, "date": "2022-03-20"}
            ],
            "product_desc": product.description,
            "category_id": 1,
            "product_image": product.image2
          }));
      print(json.decode(response.body));
      final newProduct = Product.a(
        id: product.id,
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
    var urlUpdate = '$url2/7';
    final prodIndex = productsList.indexWhere((prod) => prod.id == id);
    try {
      await Dio().put(urlUpdate,
          options: Options(headers: {
            'X-USER-TOKEN':
                'eyJlbWFpbCI6InBvQGhvdG1haWwuY29tIiwicGFzc3dvcmQiOiJwYXNzd29yZDIiLCJsb2dnZWRfYXQiOiIwOCAwMSAyMDIyIiwiZXhwaXJlZF9hdCI6IjA4IDAxIDIwMjIiLCJ1c2VyX3JvbGUiOiJ1c2VyIn0='
          }),
          data: {
            "product_name": newProduct.title,
            "product_quantity": newProduct.quantity,
            "product_price": newProduct.price,
            "product_desc": newProduct.description,
            "product_image": newProduct.image2
          });
    } catch (er) {
      print(er);
    }
    if (prodIndex >= 0) {
      productsList[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final urlDelete = Uri.parse('$url2+/9');
    final existingProductIndex =
        productsList.indexWhere((prod) => prod.id == id);
    //var existingProduct = productsList[existingProductIndex];
    productsList.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(urlDelete, headers: {
      'X-USER-TOKEN':
          'eyJlbWFpbCI6InBvQGhvdG1haWwuY29tIiwicGFzc3dvcmQiOiJwYXNzd29yZDIiLCJsb2dnZWRfYXQiOiIwOCAwMSAyMDIyIiwiZXhwaXJlZF9hdCI6IjA4IDAxIDIwMjIiLCJ1c2VyX3JvbGUiOiJ1c2VyIn0='
    });
    if (response.statusCode >= 400) {
      //productsList.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    //existingProduct = null;
  }
}
