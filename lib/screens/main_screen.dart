import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/produce_item.dart';
import 'package:online_shop/widgets/see_more.dart';

import '../widgets/banner_slider.dart';
import '../widgets/category_items.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: CustomColor.backGroundColor,
            systemNavigationBarColor: CustomColor.backGroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 44, right: 44, top: 25, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'دسته بندی',
                      style: theme.textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 44),
                child: SizedBox(
                  height: 100,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryItems();
                      },
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SeeMore(
                text: 'پر فروش ترین ها',
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProduceItem();
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SeeMore(text: 'پر بازدید ترین ها'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProduceItem();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
