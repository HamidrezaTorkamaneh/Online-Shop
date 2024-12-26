import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/see_more.dart';
import '../widgets/banner_slider.dart';
import '../widgets/category_items.dart';
import '../widgets/product_item.dart';
import '../widgets/search_app_bar.dart';

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
          physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            SliverToBoxAdapter(
              child: SearchAppBar(),
            ),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryItems();
                    },
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ProductItem(),
                      );
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ProductItem(),
                      );
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
