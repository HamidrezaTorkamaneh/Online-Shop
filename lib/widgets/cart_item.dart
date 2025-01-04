import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class CartItem extends StatelessWidget{
  CartItem({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 44,vertical: 10),
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 32, 10, 41),
                child: Image.asset('assets/images/iphone.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 17),
                  Text(
                    'آیفون ۱۳ پرو مکس',
                    style: theme.textTheme.headline1?.apply(
                        color: Colors.black, fontSizeDelta: 6),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'گارانتی ۱۸ ماه مدیا پردازش',
                    style: theme.textTheme.headline1?.apply(
                      color: CustomColor.greyColor,
                      fontSizeDelta: -1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '۴۶,۰۰۰,۰۰۰',
                        style: theme.textTheme.headline1?.apply(
                          color: CustomColor.greyColor,
                          fontSizeDelta: -1,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'تومان',
                        style: theme.textTheme.headline1?.apply(
                          color: CustomColor.greyColor,
                          fontSizeDelta: -1,
                        ),
                      ),
                      SizedBox(width: 5),
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
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 94,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: CustomColor.greyColor)),
                        child: Row(
                          children: [
                            Text(
                              '۲۵۶ گیگابایت',
                              style: theme.textTheme.headline1?.apply(
                                color: CustomColor.greyColor,
                                fontSizeDelta: -1,
                              ),
                            ),
                            SizedBox(width: 10),
                            CustomIcon(
                                icon: 'change',
                                color: CustomColor.greyColor,
                                size: 14),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        width: 100,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: CustomColor.greyColor)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              maxRadius: 5,
                              backgroundColor:
                              CustomColor.greenColor2,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'سبز کله غازی',
                              style: theme.textTheme.headline1?.apply(
                                color: CustomColor.greyColor,
                                fontSizeDelta: -1,
                              ),
                            ),
                            SizedBox(width: 5),
                            CustomIcon(
                                icon: 'change',
                                color: CustomColor.greyColor,
                                size: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 45,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColor.greyColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '1',
                              style: theme.textTheme.headline1?.apply(
                                color: CustomColor.greyColor,
                              ),
                            ),
                            Spacer(),
                            CustomIcon(
                                icon: 'change',
                                color: CustomColor.greyColor,
                                size: 14),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 70,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColor.greyColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            CustomIcon(
                                icon: 'active_fav',
                                color: CustomColor.blueColor,
                                size: 14),
                            Spacer(),
                            Text(
                              'ذخیره',
                              style: theme.textTheme.headline1?.apply(
                                color: CustomColor.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 62,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColor.greyColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            CustomIcon(
                                icon: 'delete',
                                color: CustomColor.greyColor,
                                size: 14),
                            Spacer(),
                            Text(
                              'حذف',
                              style: theme.textTheme.headline1?.apply(
                                color: CustomColor.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          DottedLine(
            lineThickness: 0.5,
            dashLength: 5,
            dashColor: CustomColor.greyColor,
            dashGapLength: 3,
            dashGapColor: Colors.transparent,
          ),
          SizedBox(height: 20),
          Text(
            '۴۵,۳۵۰,۰۰۰ تومان',
            style: theme.textTheme.headline1?.apply(
              fontSizeDelta: 5,
            ),
          )
        ],
      ),
    );
  }
}