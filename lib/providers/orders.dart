import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'cart.dart';

class OrderItem {
  final String id;
  final int amount;
  final List<CartItem> items;
  final DateTime dateTime;

  OrderItem(@required this.id, @required this.amount, @required this.items,
      @required this.dateTime);
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders;
  final String userId;

  Orders(this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }
}
