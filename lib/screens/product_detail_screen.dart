import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/custom_app_bar2.dart';
import 'package:online_shop/widgets/custom_color.dart';

import '../widgets/album_of_product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar2(text: 'آیفون'),
          SizedBox(height: 30),
          Text(
            'آیفون SE 2022',
            style: theme.textTheme.headline1?.apply(
              fontSizeDelta: 5,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
            height: 284,
            width: 340,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: -20,
                  offset: Offset(0.0, 3),
                  color: Colors.black,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIcon(
                        icon: 'active_fav',
                        color: CustomColor.greyColor,
                        size: 20),
                    Spacer(),
                    Expanded(
                        child: Image.asset('assets/images/iphone.png',
                            width: 101, height: 148)),
                    SizedBox(width: 60),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        '۴.۶',
                        style:
                            theme.textTheme.headline1?.apply(fontSizeDelta: 1),
                      ),
                    ),
                    SizedBox(width: 5),
                    CustomIcon(
                        icon: 'star', color: CustomColor.goldColor, size: 20),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return AlbumOfProduct();
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
