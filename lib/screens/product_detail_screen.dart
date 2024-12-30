import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/custom_app_bar2.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/detail_of_product.dart';
import 'package:online_shop/widgets/select_color.dart';
import 'package:online_shop/widgets/specification_item.dart';
import 'package:online_shop/widgets/storage_item.dart';

import '../widgets/album_of_product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(
        child: CustomScrollView(
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
                padding: const EdgeInsets.only(left: 44,right: 44,bottom: 10),
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
                  SpecificationItem(specification: 'مشخصات فنی'),
                  SpecificationItem(specification: 'توضیحات محصول'),
                  SpecificationItem(specification: 'نظرات کاربران'),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
