import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/custom_app_bar2.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/detail_of_product.dart';
import 'package:online_shop/widgets/price_tag_button.dart';
import 'package:online_shop/widgets/select_color.dart';
import 'package:online_shop/widgets/specification_item.dart';
import 'package:online_shop/widgets/storage_item.dart';
import '../widgets/add_to_basket_button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar2(text: 'آیفون'),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'آیفون SE 2022',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline1?.apply(
                    fontSizeDelta: 5,
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20),
            SliverToBoxAdapter(
              child: DetailOfProduct(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 20, 44, 10),
                child: Text(
                  'انتخاب رنگ',
                  style: theme.textTheme.headline1?.apply(
                    fontSizeDelta: 1,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
                child: Row(
                  children: [
                    SelectColor(),
                    SelectColor(),
                    SelectColor(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 0, 44, 10),
                child: Text(
                  'انتخاب رنگ',
                  style: theme.textTheme.headline1?.apply(
                    fontSizeDelta: 1,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, bottom: 10),
                child: Row(
                  children: [
                    StorageItem(storage: '۱۲۸'),
                    StorageItem(storage: '۲۵۶'),
                    StorageItem(storage: '۵۱۲'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SpecificationItem(specification: 'مشخصات فنی:'),
                  SpecificationItem(specification: 'توضیحات محصول:'),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
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
                          'نظرات کاربران:',
                          style: theme.textTheme.headline1?.apply(
                            fontSizeDelta: 2,
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 26,
                              width: 26,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 30,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 40,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey,
                                ),
                                child: Center(
                                  child: Text(
                                    '۱۰+',
                                    style: theme.textTheme.headline1
                                        ?.apply(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                        CustomIcon(
                            icon: 'left_arrow_circle',
                            color: CustomColor.blueColor,
                            size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 10)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AddToBasketButton(),
                    PriceTagButoon(),
                  ],
                ),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      ),
    );
  }
}
