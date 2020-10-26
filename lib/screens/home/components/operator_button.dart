import 'package:es_cafeteria/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

class OperatorButton extends StatelessWidget {
  final String image;
  final Color color;
  const OperatorButton({
    Key key,
    this.image,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: getProportionateScreenWidth(50),
            height: getProportionateScreenWidth(50),
            decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: kGrayColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8))),
        Positioned.fill(
            child: Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(image),
        ))
      ],
    );
  }
}
