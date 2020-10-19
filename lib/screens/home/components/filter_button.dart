import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final Function press;
  final String icon;
  final bool hasIcon;
  const FilterButton({
    Key key,
    this.title,
    this.press,
    this.icon,
    this.hasIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: 130,
        height: 44,
        child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: press,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: hasIcon
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                hasIcon ? SvgPicture.asset(icon) : SizedBox.shrink(),
                SizedBox(
                  width: 8,
                ),
                Text(title)
              ],
            )),
      ),
    );
  }
}
