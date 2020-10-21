import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(@required this.id, @required this.title, @required this.quantity,
      @required this.price);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String itemId, double price, String title, int quantity) {
    if (_items.containsKey(itemId)) {
      _items.update(
          itemId,
          (existingCartItem) => CartItem(
              existingCartItem.id,
              existingCartItem.title,
              existingCartItem.quantity + quantity,
              existingCartItem.price));
    } else {
      _items.putIfAbsent(itemId,
          () => CartItem(DateTime.now().toString(), title, quantity, price));
    }
    notifyListeners();
  }

  void removeItem(String itemId) {
    _items.remove(itemId);
    notifyListeners();
  }
}
