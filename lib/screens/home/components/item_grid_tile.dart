import 'package:es_cafeteria/models/item.dart';
import 'package:flutter/material.dart';

class ItemGridTile extends StatelessWidget {
  final Item itemData;
  const ItemGridTile({
    Key key,
    this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            itemData.img,
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
                itemData.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${itemData.price} Đ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "Còn: #${itemData.stock}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
