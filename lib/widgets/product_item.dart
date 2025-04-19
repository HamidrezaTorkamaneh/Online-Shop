import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/card/card_bloc.dart';
import 'package:online_shop/di/di.dart';
import 'package:online_shop/screens/product_detail_screen.dart';
import 'package:online_shop/util/extensions/int_extension.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/cached_image.dart';

import '../data/model/product.dart';
import 'custom_color.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: 216,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider<CardBloc>.value(
                  value: locator.get<CardBloc>(),
                  child: ProductDetailScreen(product),
                ),
              ),
            );
          },
          child: Column(
            children: [
              SizedBox(height: 10),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Expanded(child: Container()),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child:
                        Center(child: CachedImage(imageUrl: product.thumbnail)),
                  ),
                  Positioned(
                    right: 12,
                    child: CustomIcon(
                      icon: 'active_fav',
                      color: CustomColor.blueColor2,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: Container(
                      width: 25,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomColor.redColor,
                      ),
                      child: Center(
                        child: Text(
                          '${product.percent!.round().toString()} %',
                          style: theme.textTheme.headline1?.apply(
                            fontSizeDelta: -3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.headline1?.apply(
                        fontSizeDelta: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                height: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: CustomColor.blueColor2,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 25,
                      spreadRadius: -15,
                      offset: Offset(0.0, 15),
                      color: CustomColor.blueColor2,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    CustomIcon(
                      icon: 'right_arrow_circle',
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.realPrice.convertToPrice(),
                          style: theme.textTheme.headline2?.apply(
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white,
                            fontSizeDelta: -0.5,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          product.price.convertToPrice(),
                          style: theme.textTheme.headline1?.apply(
                            color: Colors.white,
                            fontSizeDelta: 0,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      'تومان',
                      style: theme.textTheme.headline1?.apply(
                        color: Colors.white,
                        fontSizeDelta: 2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


