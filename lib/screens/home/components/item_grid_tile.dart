import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import 'default_button.dart';
import 'operator_button.dart';

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
   
  Dialog _buildAddCartDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        // padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
        width: 370,
        height: 248,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 29),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(price.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: OperatorButton(
                          color: Colors.white,
                          image: "assets/icons/tru.svg",
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 48,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: OperatorButton(
                      color: kPrimaryColor,
                      image: "assets/icons/cong.svg",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              DefaultButton(
                title: "OK",
                press: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
   _showAddCartDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return _buildAddCartDialog();
        });
  }
    return GestureDetector(
          onTap: _showAddCartDialog,
          child: GridTile(
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
          )),
    );
  }

  
}
