import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/cart_item.dart';
import 'package:online_shop/widgets/custom_app_bar1.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/my_button.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppBar1(text: 'سبد خرید'),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 10,
                    (context, index) {
                      return CartItem();
                    },
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 80),
                ),
              ],
            ),
            MyButton(text: 'ادامه فرایند خرید',color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
