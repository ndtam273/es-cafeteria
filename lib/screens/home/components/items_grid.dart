import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:flutter/material.dart';

import '../../../dummy_data.dart';
import 'item_grid_tile.dart';
import 'package:provider/provider.dart';

class ItemsGrid extends StatelessWidget {
  final List<Item> displayItems;
  const ItemsGrid({
    Key key,
    this.displayItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 18 / 22,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: displayItems.length,
        itemBuilder: (ctx, i) {
          return ItemGridTile(
            id: displayItems[i].id,
            img: displayItems[i].img,
            name: displayItems[i].name,
            price: displayItems[i].price,
            stock: displayItems[i].stock,
            itemType: displayItems[i].itemType,
          );
        });
  }
}
