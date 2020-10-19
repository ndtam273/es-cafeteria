import 'package:es_cafeteria/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
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
          Spacer(),
          GestureDetector(
            onTap: () {
              print("abcde");
            },
            child: Stack(
              children: [
                Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kGrayColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8))),
                Padding(
                    padding: EdgeInsets.all(5.5),
                    child: SvgPicture.asset("assets/icons/trash.svg"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
