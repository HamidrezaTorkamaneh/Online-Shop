import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/widgets/product_item.dart';

import '../data/repository/category_repository.dart';
import '../widgets/custom_app_bar1.dart';
import '../widgets/custom_color.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar1(text: 'پرفروش ترین ها'),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 160,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // child: ProductItem(),
                    child: Text('1'),

                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
