import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final int quanity;
  final String image;
  final String name;
  const CartItem({
    Key key,
    this.quanity,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            image,
            height: 30,
            width: 30,
          ),
        ),
        Text("$quanity x $name"),
      ],
    );
  }
}
