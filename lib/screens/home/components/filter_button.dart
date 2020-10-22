import 'package:es_cafeteria/providers/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool hasIcon;
  final String filterKey;
  const FilterButton({
    Key key,
    this.title,
    this.icon,
    this.hasIcon = true,
    this.filterKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemsData = Provider.of<Items>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        width: 130,
        height: 44,
        child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: () {
              itemsData.filterItems(filterKey);
            },
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
