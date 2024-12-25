import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class SeeMore extends StatelessWidget{
  String text;
  SeeMore ({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomIcon(
              icon: 'left_arrow_circle',
              color: CustomColor.blueColor,
              size: 20),
          SizedBox(width: 10),
          Text(
            'مشاهده همه',
            style: theme.textTheme.headline3?.apply(
              color: CustomColor.blueColor,
            ),
          ),
          Spacer(),
          Text(
            text,
            style: theme.textTheme.headline3,
          ),
        ],
      ),
    );

  }
}