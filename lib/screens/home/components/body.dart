import 'dart:js';

import 'package:es_cafeteria/constant.dart';
import 'package:es_cafeteria/dummy_data.dart';
import 'package:es_cafeteria/models/item.dart';
import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cart_item.dart';
import 'default_button.dart';
import 'filter_button.dart';
import 'item_grid_tile.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: kGrayBackgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 40, bottom: 20),
                  child: Row(
                    children: [
                      FilterButton(
                        title: "Food",
                        icon: "assets/icons/snack 1.svg",
                        press: () {},
                      ),
                      FilterButton(
                        title: "Drink",
                        icon: "assets/icons/alcohol 1.svg",
                        press: () {},
                      ),
                      FilterButton(
                        title: "Others",
                        press: () {},
                        icon: "assets/icons/alcohol 1.svg",
                        hasIcon: false,
                      ),
                      Spacer(),
                      SizedBox(
                        width: 130,
                        height: 44,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: kGrayColor,
                            ),
                          ),
                          color: Colors.transparent,
                          textColor: kPrimaryColor,
                          child: Text("Refresh"),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 18 / 22,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: DUMMY_ITEMS.map((itemData) {
                      return ItemGridTile(
                        itemData: itemData,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/cart.svg"),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Cart",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                CartItem(
                  image: "assets/images/cola.jpg",
                  quanity: 1,
                  name: "Cola",
                ),
                CartItem(
                  image: "assets/images/xucxich.jpg",
                  quanity: 5,
                  name: "Sausage",
                ),
                Spacer(),
                DefaultButton(
                  title: "Check Out",
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
