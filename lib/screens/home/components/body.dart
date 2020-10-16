import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cart_item.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Row(
                children: [],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/cart.svg"),
                  Text(
                    "Cart",
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
            ],
          ),
        ),
      ],
    ));
  }
}
