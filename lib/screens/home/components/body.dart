import 'package:provider/provider.dart';
import 'package:es_cafeteria/constant.dart';
import 'package:es_cafeteria/dummy_data.dart';
import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

import 'cart_item.dart';
import 'control_panel.dart';
import 'default_button.dart';
import 'default_button.dart';

import 'filter_button.dart';
import 'item_grid_tile.dart';
import 'items_grid.dart';
import 'operator_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _showCompleteDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return _buildCompleteDialog();
        });
  }

  _showCheckOutDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return _buildCheckoutDialog();
        });
  }

  _showAddCartDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return _buildAddCartDialog();
        });
  }

  Dialog _buildCompleteDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 370,
        height: 290,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0))
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 29, top: 10),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/completed.svg", height: 182),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                title: "OK",
                press: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Dialog _buildCheckoutDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
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
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 29),
          child: Column(
            children: [
              Text("Enter Your Password"),
              Text("(Input ES staff ID to checkout.)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kGrayColor)),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "*******",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: kGrayColor)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                title: "OK",
                press: () {
                  Navigator.pop(context);
                  _showCompleteDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                      "assets/images/cola.jpg",
                      fit: BoxFit.cover,
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cola",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("100.000"),
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

  @override
  Widget build(BuildContext context) {
    // final itemsData = Provider.of<Items>(context);
    // final items = itemsData.items;
    var expanded = Expanded(
      flex: 4,
      child: Container(
        color: kGrayBackgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 40, bottom: 20),
              child: ControlPanel(),
            ),
            Expanded(
              child: ItemsGrid(),
            ),
          ],
        ),
      ),
    );
    return Row(
      children: [
        expanded,
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
                DefaultButton(title: "Check Out", press: _showCheckOutDialog),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
