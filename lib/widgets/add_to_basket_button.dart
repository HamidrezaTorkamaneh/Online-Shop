import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:online_shop/bloc/card/card_bloc.dart';
import 'package:online_shop/bloc/card/card_event.dart';
import 'package:online_shop/bloc/product/product_bloc.dart';
import 'package:online_shop/bloc/product/product_event.dart';
import 'package:online_shop/data/model/card_item.dart';
import '../data/model/product.dart';
import 'custom_color.dart';

class AddToBasketButton extends StatelessWidget {
  Product product;

  AddToBasketButton(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        onTap: () {
          context.read<ProductBloc>().add(ProductAddToBasket(product));
          context.read<CardBloc>().add(CardFetchFromHiveEvent());
          final snackBar = SnackBar(
            content: Text(
              'محصول به سبد خرید اضافه شد.',
              style: theme.textTheme.headline1!.apply(
                color: Colors.white,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: CustomColor.blueColor2,
            duration: Duration(seconds: 2),
          );
          Duration(seconds: 2);
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 60,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: CustomColor.blueColor2,
              ),
            ),
            ClipRRect(
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
            )
          ],
        ),
      ),
    );
  }
}
