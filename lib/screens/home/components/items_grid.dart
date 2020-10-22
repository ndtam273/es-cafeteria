import 'package:es_cafeteria/providers/items.dart';
import 'package:flutter/material.dart';

import '../../../dummy_data.dart';
import 'item_grid_tile.dart';
import 'package:provider/provider.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final items = itemsData.items;
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 18 / 22,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: items.length,
      itemBuilder: (ctx, i) => ItemGridTile(
        id: items[i].id,
        img: items[i].img,
        name: items[i].name,
        price: items[i].price,
        stock: items[i].stock,
        itemType: items[i].itemType,
      ),
    );
  }
}
