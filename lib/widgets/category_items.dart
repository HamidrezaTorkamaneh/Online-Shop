import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(

            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.red,
              shadows: [
                BoxShadow(
                  blurRadius: 25,
                  spreadRadius: -12,
                  offset: Offset(0.0, 15),
                  color: Colors.red,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.ads_click,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'همه',
            style: theme.textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
