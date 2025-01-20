import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_items.dart';

class CategoryListTitle extends StatelessWidget{
  const CategoryListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
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
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) {
                 return CategoryItems();
               },
             ),
           ),
         ],
       ),
     ),
   );
  }
  
}