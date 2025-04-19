import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class CustomAppBar1 extends StatelessWidget {
  String text;

  CustomAppBar1({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.symmetric(horizontal: 44, vertical: 25),
      height: 46,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.headline1
                  ?.apply(color: CustomColor.blueColor2,
              fontSizeDelta: 3),
            ),
          ),
          CustomIcon(icon: 'apple', color: CustomColor.blueColor2, size: 25),
        ],
      ),
    );
  }
}
