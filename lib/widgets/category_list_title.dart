import 'package:flutter/material.dart';
import '../data/model/category.dart';
import 'category_items.dart';

class CategoryListTitle extends StatelessWidget {
  List<Category> listCategories;
  CategoryListTitle(this.listCategories,{super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'دسته بندی',
              style: theme.textTheme.headline3,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: listCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryItems(listCategories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}