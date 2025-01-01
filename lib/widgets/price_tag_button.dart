import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class PriceTagButoon extends StatelessWidget {
  PriceTagButoon({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColor.greenColor,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 53,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent,
              ),
              child: Center(
                  child: Row(
                children: [
                  Container(
                    width: 25,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: CustomColor.redColor,
                    ),
                    child: Center(
                      child: Text(
                        '٪۵',
                        style: theme.textTheme.headline1?.apply(
                          fontSizeDelta: -1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '۴۶,۰۰۰,۰۰۰',
                        style: theme.textTheme.headline2?.apply(
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.white,
                          fontSizeDelta: -0.5,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '۴۵,۳۵۰,۰۰۰',
                        style: theme.textTheme.headline1?.apply(
                          color: Colors.white,
                          fontSizeDelta: 1,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    'تومان',
                    style: theme.textTheme.headline1?.apply(
                      color: Colors.white,
                      fontSizeDelta: 2,
                    ),
                  ),
                ],
              )),
            ),
          ),
        )
      ],
    );
  }
}
