import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/Custom_icon.dart';

import 'custom_color.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(

      height: 216,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Expanded(child: Container()),
              Image.asset('assets/images/iphone.png'),
              Positioned(
                right: 12,
                child: CustomIcon(
                  icon: 'active_fav',
                  color: CustomColor.blueColor,
                  size: 20,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Container(
                  width: 25,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColor.redColor,
                  ),
                  child: Center(
                    child: Text(
                      '٪۳',
                      style: theme.textTheme.headline1?.apply(
                        fontSizeDelta: -1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'آیفون ۱۳ پرو مکس',
                  textAlign: TextAlign.start,
                  style: theme.textTheme.headline1?.apply(
                    fontSizeDelta: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              color: CustomColor.blueColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 25,
                  spreadRadius: -15,
                  offset: Offset(0.0, 15),
                  color: CustomColor.blueColor,
                )
              ],
            ),
            child: Row(
              children: [
                CustomIcon(
                  icon: 'right_arrow_circle',
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 15),
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
                    SizedBox(height: 5),
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
            ),
          )
        ],
      ),
    );
  }
}
