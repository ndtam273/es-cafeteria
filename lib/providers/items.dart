import 'package:es_cafeteria/dummy_data.dart';
import 'package:es_cafeteria/providers/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'item.dart';

class Items with ChangeNotifier {
  List<Item> filteredItems = [];
  List<Item> _items = [
    Item(
      id: "i1",
      name: "Cola",
      price: 100.000,
      stock: 5,
      img: "assets/images/cola.jpg",
      itemType: "Drink",
    ),
    Item(
      id: "i1",
      name: "Cola",
      price: 100.000,
      stock: 5,
      img: "assets/images/cola.jpg",
      itemType: "Drink",
    ),
    Item(
      id: "i1",
      name: "Cola",
      price: 100.000,
      stock: 5,
      img: "assets/images/cola.jpg",
      itemType: "Drink",
    ),
    Item(
        id: "i2",
        name: "Xuc xich",
        price: 150.000,
        stock: 5,
        img: "assets/images/xucxich.jpg",
        itemType: "Food"),
    Item(
      id: "i2",
      name: "Xuc xich",
      price: 150.000,
      stock: 5,
      img: "assets/images/xucxich.jpg",
      itemType: "Food",
    )
  ];
  // final String userId;

  List<Item> get items {
    return [..._items];
  }

  void filterItems(String filterKey) {
    filteredItems = _items.where((item) => item.itemType == filterKey).toList();
  }
}