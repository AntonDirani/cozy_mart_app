import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteItem {
  final String id;
  late String title;
  late double price;
  late int quantity;
  late DateTime expDate;

  FavoriteItem(
      {required this.title,
      required this.id,
      required this.price,
      required this.quantity,
      required this.expDate});
}

class FavoriteItemsProvider extends ChangeNotifier {
  Map<String, FavoriteItem> _items = {};

  Map<String, FavoriteItem> get items {
    return {..._items};
  }

  void addFavorite({
    required String productId,
    required double price,
    required String title,
    required int quantity,
    required DateTime date,
  }) {
    if (_items.containsKey(productId)) {
      // change quantity...
      /*_items.update(
        productId,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );*/
    } else {
      _items.putIfAbsent(
        productId,
        () => FavoriteItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: quantity,
            expDate: date),
      );
      print('click');
    }
    notifyListeners();
  }
}
