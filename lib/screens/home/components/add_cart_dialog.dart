import 'package:es_cafeteria/providers/cart.dart';
import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';
import 'default_button.dart';
import 'operator_button.dart';

class AddCartDialog extends StatefulWidget {
  final String name;
  final String img;
  final int price;
  final int stock;
  final String id;

  AddCartDialog({Key key, this.name, this.img, this.price, this.stock, this.id})
      : super(key: key);
  @override
  _AddCartDialogState createState() => _AddCartDialogState();
}

class _AddCartDialogState extends State<AddCartDialog> {
  int quantity = 1;

  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final itemsData = Provider.of<Items>(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        // padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
        width: getProportionateScreenWidth(370),
        height: getProportionateScreenHeight(268),
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
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(30),
              vertical: getProportionateScreenHeight(29)),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.img,
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(110),
                      height: getProportionateScreenHeight(110),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text(widget.price.toString()),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (quantity > 0) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        child: OperatorButton(
                          color: Colors.white,
                          image: "assets/icons/tru.svg",
                        ),
                      ),
                    ],
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(48),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (quantity < widget.stock) {
                        setState(() {
                          quantity++;
                        });
                      }
                    },
                    child: OperatorButton(
                      color: kPrimaryColor,
                      image: "assets/icons/cong.svg",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              DefaultButton(
                title: widget.stock > 0 ? "OK" : "Out of stock",
                press: widget.stock > 0
                    ? () {
                        cartData.addItem(widget.id, widget.price, widget.name,
                            quantity, widget.img);
                        itemsData.updateItem(
                          widget.id,
                          Item(
                              id: widget.id,
                              name: widget.name,
                              price: widget.price,
                              stock: widget.stock - quantity,
                              img: widget.img),
                        );

                        Navigator.pop(context);
                      }
                    : () {},
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
