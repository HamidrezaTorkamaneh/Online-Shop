import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:online_shop/screens/product_list_screen.dart';
import 'package:online_shop/widgets/cached_image.dart';

import '../data/model/category.dart';

class CategoryItems extends StatelessWidget {
  final Category category;

  CategoryItems(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    String categoryColor = 'ff${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Material(
        borderRadius: BorderRadius.circular(40),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => CategoryProductBloc(),
                  child: ProductListScreen(category),
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {},
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: ShapeDecoration(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Color(hexColor),
                          shadows: [
                            BoxShadow(
                              blurRadius: 25,
                              spreadRadius: -12,
                              offset: Offset(0.0, 15),
                              color: Color(hexColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: Center(
                          child: CachedImage(
                        imageUrl: category.icon,
                      ))),
                ],
              ),
              SizedBox(height: 10),
              Text(
                category.title ?? 'محصول',
                style: theme.textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
