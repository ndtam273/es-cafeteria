import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemGridTile extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  int stock;
  final String img;
  final String itemType;

  ItemGridTile(
      {Key key,
      this.id,
      this.name,
      this.price,
      this.img,
      this.itemType,
      this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
        footer: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "$price Đ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "Còn: #$stock",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
