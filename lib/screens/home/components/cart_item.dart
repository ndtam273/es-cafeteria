import 'package:es_cafeteria/constant.dart';
import 'package:es_cafeteria/providers/cart.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String itemId;
  final int quanity;
  final String image;
  final String name;
  const CartItem({
    Key key,
    this.itemId,
    this.id,
    this.quanity,
    this.image,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final itemsData = Provider.of<Items>(context);
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              height: getProportionateScreenHeight(30),
              width: getProportionateScreenWidth(30),
            ),
          ),
          Flexible(
            child: Text(
              "$quanity x $name",
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(16)),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              cartData.removeItem(itemId);
              itemsData.reStockSingleItem(itemId, quanity);
            },
            child: Stack(
              children: [
                Container(
                    width: getProportionateScreenWidth(30),
                    height: getProportionateScreenWidth(30),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: kGrayColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8))),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/icons/trash.svg",
                          height: getProportionateScreenHeight(17),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
