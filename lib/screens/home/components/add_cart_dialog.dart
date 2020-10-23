import 'package:es_cafeteria/providers/cart.dart';
import 'package:es_cafeteria/providers/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';
import 'default_button.dart';
import 'operator_button.dart';

class AddCartDialog extends StatefulWidget {
  final String name;
  final String img;
  final double price;
  final int stock;

  AddCartDialog({Key key, this.name, this.img, this.price, this.stock})
      : super(key: key);
  @override
  _AddCartDialogState createState() => _AddCartDialogState();
}

class _AddCartDialogState extends State<AddCartDialog> {
  int quantity = 1;

  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    final itemData = Provider.of<Item>(context);
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
                      widget.img,
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
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
                        height: 10,
                      ),
                      Text(widget.price.toString()),
                      SizedBox(
                        height: 10,
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
                      fontSize: 48,
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
                height: 30,
              ),
              DefaultButton(
                title: "OK",
                press: () {
                  cartData.addItem(
                      itemData.id, itemData.price, itemData.name, quantity);
                  itemData.subtractItem(quantity);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
