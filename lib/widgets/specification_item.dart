import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class SpecificationItem extends StatelessWidget{
  String specification;
  SpecificationItem({super.key,required this.specification});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 44,vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 340,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            specification,
            style: theme.textTheme.headline1?.apply(
              fontSizeDelta: 2,
            ),
          ),
          Spacer(),
          Text(
            'مشاهده',
            style: theme.textTheme.headline1?.apply(
              fontSizeDelta: 2,
              color: CustomColor.blueColor,
            ),

          ),
          SizedBox(width: 5),
          CustomIcon(icon: 'left_arrow_circle', color: CustomColor.blueColor, size: 20),
        ],
      ),
    );
  }
}