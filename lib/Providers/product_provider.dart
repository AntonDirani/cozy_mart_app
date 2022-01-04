//import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class Product extends ChangeNotifier {
  late final int id;
  late final String title;
  late final int quantity;
  late final String phoneNumber;
  late final String description;
  //late final File image; //File
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
    // required this.image,
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
  List<Product> productsList = [
    Product.a(
        id: 0,
        title: 'Shirt',
        phoneNumber: '0936189449',
        quantity: 7,
        price: 50.0,
        description:
            'The standa33 from "de Finibus Bonorir exash versiotion by H. Rackham.'),
    Product.a(
        id: 1,
        title: 'Shirt',
        phoneNumber: '0936189449',
        quantity: 7,
        price: 50.0,
        description:
            'The standa33 from "de Finibus Bonorir exash versiotion by H. Rackham.'),
    Product.a(
        id: 2,
        title: 'tshirt',
        phoneNumber: '0936189449',
        quantity: 7,
        price: 50.0,
        description:
            'The standa33 from "de Finibus Bonorir exash versiotion by H. Rackham.'),
  ];

  late File image;

  void addProduct({required Product product}) {
    final newProduct = Product.a(
      id: 50,
      description: product.description,
      title: product.title,
      phoneNumber: product.phoneNumber,
      quantity: product.quantity,
      //expDate: expDate,
      //category: category,
      price: product.price,
      //image: image,
    );
    productsList.add(newProduct);
    print(productsList.length);
    print(productsList[3].title);
    notifyListeners();
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
