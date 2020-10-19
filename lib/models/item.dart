import 'package:flutter/material.dart';

class Item {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String img;

  const Item(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.stock,
      this.img});
}
