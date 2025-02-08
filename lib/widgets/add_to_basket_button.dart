import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/repository/product_detail_repository.dart';

import '../di/di.dart';
import 'custom_color.dart';

class AddToBasketButton extends StatelessWidget {
  AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColor.blueColor,
          ),
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () async {
              IDetailProductRepository repository =locator.get();
              var response= await repository.getProductImage();
              response.fold((l) {

              }, (r){
               r.forEach((element) {
                 print(element.imageUrl);
               });
              });
            },
            borderRadius: BorderRadius.circular(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 53,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      'افزودن به سبد خرید',
                      style: theme.textTheme.headline1
                          ?.apply(fontSizeDelta: 3, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
