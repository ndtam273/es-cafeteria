import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String img;
  final int quantity;
  final int price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price,
      @required this.img});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartitems {
    return {..._cartItems};
  }

  int get itemsCount {
    return _cartItems.length;
  }

  int get totalItem {
    var total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.quantity;
    });
    return total;
  }

  int get totalAmount {
    var total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
      String itemId, int price, String title, int quantity, String img) {
    if (_cartItems.containsKey(itemId)) {
      _cartItems.update(
          itemId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + quantity,
              price: existingCartItem.price,
              img: existingCartItem.img));
    } else {
      _cartItems.putIfAbsent(
          itemId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                quantity: quantity,
                price: price,
                img: img,
              ));
    }
    notifyListeners();
  }

  void removeItem(String itemId) {
    _cartItems.remove(itemId);
    notifyListeners();
  }
}
