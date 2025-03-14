import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/model/card_item.dart';
import 'package:online_shop/util/extensions/string_extensions.dart';
import 'package:online_shop/widgets/cached_image.dart';
import 'Custom_icon.dart';
import 'custom_color.dart';

class CartItem extends StatelessWidget {
  String storage;
  String? color;
  String colorName;
  CardItem cardItem;
  CartItem(
      {super.key, required this.colorName, this.color, required this.storage,required this.cardItem});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
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
                child: SizedBox(
                  height: 107,
                  width: 80  ,
                  child: Center(
                    child: CachedImage(imageUrl: cardItem.thumbnail),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 17),
                  Text(
                    cardItem.name,
                    style: theme.textTheme.headline1
                        ?.apply(color: Colors.black, fontSizeDelta: 6),
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
                        '${cardItem.realPrice.toString()} تومان ',
                        style: theme.textTheme.headline1?.apply(
                          color: CustomColor.greyColor,
                          fontSizeDelta: -1,
                        ),
                      ),
                      SizedBox(width: 5),

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
                            '${cardItem.percent!.round().toString()} %',
                            style: theme.textTheme.headline1?.apply(
                              fontSizeDelta: -3,
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
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        width: 94,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: CustomColor.greyColor)),
                        child: Center(
                          child: Text(
                            storage,
                            style: theme.textTheme.headline1?.apply(
                              color: CustomColor.greyColor,
                              fontSizeDelta: -2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        // width: 100,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: CustomColor.greyColor)),
                        child: Row(
                          children: [
                            Text(
                              colorName,
                              style: theme.textTheme.headline1?.apply(
                                color: CustomColor.greyColor,
                                fontSizeDelta: -2,
                              ),
                            ),
                            SizedBox(width: 8),
                            if (color != null) ...{
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color.parseToColor(),
                                ),
                              )
                            }
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

                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColor.redColor),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              CustomIcon(
                                  icon: 'delete',
                                  color: CustomColor.redColor,
                                  size: 14),
                              SizedBox(width: 5),

                              Text(
                                'حذف',
                                style: theme.textTheme.headline1?.apply(
                                    color: CustomColor.redColor,
                                    fontSizeDelta: -1),
                              ),
                            ],
                          ),
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
            '${cardItem.price.toString()} تومان ',
            style: theme.textTheme.headline1?.apply(
              fontSizeDelta: 5,
            ),
          )
        ],
      ),
    );
  }
}
