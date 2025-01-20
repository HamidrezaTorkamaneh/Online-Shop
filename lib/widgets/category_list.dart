import 'package:flutter/cupertino.dart';
import 'package:online_shop/widgets/product_item.dart';

class CategoryList extends StatelessWidget{
  const CategoryList({super.key});
  @override
  Widget build(BuildContext context) {
    return               SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(right: 33),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ProductItem(),
              );
            },
          ),
        ),
      ),
    );

  }
}