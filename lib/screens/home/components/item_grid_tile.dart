import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:es_cafeteria/screens/home/components/add_cart_dialog.dart';
import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import 'default_button.dart';
import 'operator_button.dart';

class ItemGridTile extends StatefulWidget {
  final String id;
  final String name;
  final int price;
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
  _ItemGridTileState createState() => _ItemGridTileState();
}

class _ItemGridTileState extends State<ItemGridTile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _showAddCartDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AddCartDialog(
              img: widget.img,
              name: widget.name,
              price: widget.price,
              stock: widget.stock,
              id: widget.id,
            );
          });
    }

    return GestureDetector(
      onTap: _showAddCartDialog,
      child: GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              widget.img,
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
                  widget.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(16)),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.price} Đ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: getProportionateScreenWidth(11)),
                    ),
                    Spacer(),
                    Text(
                      "Còn: #${widget.stock}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: getProportionateScreenWidth(11)),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
