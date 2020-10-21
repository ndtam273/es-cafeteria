import 'package:es_cafeteria/dummy_data.dart';
import 'package:es_cafeteria/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Items with ChangeNotifier {
  List<Item> _items = DUMMY_ITEMS;
  final String userId;
  Items(this.userId, this._items);

  List<Item> get items {
    return [...items];
  }

  List<Item> filteredItems(String filterKey) {
    return [...items].where((item) => item.itemType == filterKey).toList();
  }
}
