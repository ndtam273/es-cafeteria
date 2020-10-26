import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

enum itemTypes { food, drink, others }

class Item with ChangeNotifier {
  final String id;
  final String name;
  final int price;
  int stock;
  final String img;
  final String itemType;

  Item(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.stock,
      this.img,
      this.itemType});
}
