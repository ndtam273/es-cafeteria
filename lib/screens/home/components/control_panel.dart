import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'filter_button.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterButton(
          title: "Food",
          icon: "assets/icons/snack 1.svg",
          filterKey: "Food",
        ),
        FilterButton(
          title: "Drink",
          icon: "assets/icons/alcohol 1.svg",
          filterKey: "Drink",
        ),
        FilterButton(
          title: "Others",
          icon: "assets/icons/alcohol 1.svg",
          filterKey: "Others",
          hasIcon: false,
        ),
        Spacer(),
        SizedBox(
          width: 130,
          height: 44,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: kGrayColor,
              ),
            ),
            color: Colors.transparent,
            textColor: kPrimaryColor,
            child: Text("Refresh"),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
