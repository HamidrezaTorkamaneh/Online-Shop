import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'album_of_product.dart';
import 'custom_color.dart';

class DetailOfProduct extends StatelessWidget{
  const DetailOfProduct({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 44),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
    );
  }
}