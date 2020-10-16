import 'package:flutter/material.dart';

import '../../../constant.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function press;
  const DefaultButton({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: press,
        color: kPrimaryColor,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
