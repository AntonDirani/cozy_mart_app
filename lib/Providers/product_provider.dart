//import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  late final String? id;
  late final String title;
  late final int quantity;
  late final String phoneNumber;
  late final String description;
  File? image; //File
  late final DateTime expDate;
  late final String category;
  late final double price; //Price

  Random random = Random();

  Product();

  Product.a({
    required this.id,
    required this.description,
    required this.title,
    required this.phoneNumber,
    required this.quantity,
    // required this.expDate,
    //required this.category,
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
    final newProduct = Product.a(
      id: DateTime.now().toString(),
      description: product.description,
      title: product.title,
      phoneNumber: product.phoneNumber,
      quantity: product.quantity,
      //expDate: expDate,
      //category: category,
      price: product.price,
      image: product.image,
    );
    productsList.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String? id, Product newProduct) {
    final prodIndex = productsList.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      productsList[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  /*Future getImage() async {
    final _picker = ImagePicker();
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
      print('image selected');
    } else {
      print('no image selected');
    }
  }*/
}
