import 'package:es_cafeteria/providers/cart.dart';
import 'package:es_cafeteria/providers/items.dart';
import 'package:provider/provider.dart';
import 'package:es_cafeteria/constant.dart';
import 'package:es_cafeteria/dummy_data.dart';
import 'package:es_cafeteria/providers/item.dart';
import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

import 'cart_item.dart' as CI;

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
  var _showFilteredItems = false;

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

  Dialog _buildCompleteDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: getProportionateScreenWidth(370),
        height: getProportionateScreenHeight(290),
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
               EdgeInsets.only(left: getProportionateScreenWidth(30), right: getProportionateScreenWidth(30), bottom: getProportionateScreenHeight(29), top: getProportionateScreenHeight(10)),
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/completed.svg",
                  height: getProportionateScreenHeight(160)),
              SizedBox(
                height: getProportionateScreenHeight(30),
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
        width: getProportionateScreenWidth(370),
        height: getProportionateScreenHeight(248),
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
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30), vertical: getProportionateScreenHeight(29)),
          child: Column(
            children: [
               Text(
                "Enter Your Password",
                style: TextStyle(fontSize: getProportionateScreenHeight(16), fontWeight: FontWeight.bold),
              ),
               Text("(Input ES staff ID to checkout.)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kGrayColor,
                      fontSize: getProportionateScreenHeight(14))),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Container(
                height: getProportionateScreenHeight(60),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "*******",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: kGrayColor)),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
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

  @override
  Widget build(BuildContext context) {
    final itemsData = Provider.of<Items>(context);
    final cartItems = Provider.of<Cart>(context).cartitems;
    final cartData = Provider.of<Cart>(context);

    var expanded = Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                offset: const Offset(0.0, 10.0))
          ],
          color: kGrayBackgroundColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 20),
              child: Row(
                children: [
                  FilterButton(
                    title: "Food",
                    icon: "assets/icons/snack 1.svg",
                    press: () {
                      itemsData.filterItems("Food");
                      setState(() {
                        _showFilteredItems = true;
                      });
                    },
                  ),
                  FilterButton(
                    title: "Drink",
                    icon: "assets/icons/alcohol 1.svg",
                    press: () {
                      itemsData.filterItems("Drink");
                      setState(() {
                        _showFilteredItems = true;
                      });
                    },
                  ),
                  FilterButton(
                    title: "Others",
                    icon: "assets/icons/alcohol 1.svg",
                    press: () {
                      itemsData.filterItems("Others");
                      setState(() {
                        _showFilteredItems = true;
                      });
                    },
                    hasIcon: false,
                  ),
                  Spacer(),
                  SizedBox(
                    width: getProportionateScreenWidth(130),
                    height: getProportionateScreenHeight(44),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: kGrayColor,
                        ),
                      ),
                      color: Colors.transparent,
                      textColor: kPrimaryColor,
                      child: Text("Refresh",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18))),
                      onPressed: () {
                        setState(() {
                          _showFilteredItems = false;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: _showFilteredItems
                  ? ItemsGrid(
                      displayItems: itemsData.filteredItems,
                    )
                  : ItemsGrid(
                      displayItems: itemsData.items,
                    ),
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/cart.svg",
                      height: getProportionateScreenWidth(28),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    const Text(
                      "Cart",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    height: SizeConfig.screenHeight * 0.5,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return CI.CartItem(
                          id: cartItems.values.toList()[index].id,
                          itemId: cartItems.keys.toList()[index],
                          image: cartItems.values.toList()[index].img,
                          name: cartItems.values.toList()[index].title,
                          quanity: cartItems.values.toList()[index].quantity,
                        );
                      },
                      itemCount: cartItems.length,
                    ),
                  ),
                ),
                Spacer(),
                Divider(
                  thickness: 1,
                  color: kGrayColor,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  children: [
                     Text(
                      "Total: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: getProportionateScreenHeight(16)),
                    ),
                    Text(
                      cartData.totalItem.toString(),
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(16)),
                    ),
                    cartData.totalItem > 1
                        ? Text(
                            " Products",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          )
                        : Text(
                            " Product",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "${cartData.totalAmount.toString()} Đ",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        color: kPrimaryColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                DefaultButton(
                    title: "Check Out",
                    press: cartItems.length > 0 ? _showCheckOutDialog : () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
