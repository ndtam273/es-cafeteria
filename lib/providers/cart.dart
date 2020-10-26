import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  // final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
    // @required this.id, 
  @required this.title, @required this.quantity,
      @required this.price);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartitems {
    return {..._cartItems};
  }

  int get itemsCount {
    return _cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String itemId, double price, String title, int quantity) {
    if (_cartItems.containsKey(itemId)) {
      _cartItems.update(
          itemId,
          (existingCartItem) => CartItem(
              // existingCartItem.id,
              existingCartItem.title,
              existingCartItem.quantity + quantity,
              existingCartItem.price));
    } else {
      _cartItems.putIfAbsent(itemId,
          () => CartItem(
            // DateTime.now().toString(), 
          title, quantity, price));
    }
    notifyListeners();
  }

  void removeItem(String itemId) {
    _cartItems.remove(itemId);
    notifyListeners();
  }
}
