import 'package:flutter/cupertino.dart';
import 'package:online_shop/widgets/product_item.dart';

import '../data/model/product.dart';

class BestSellerProducts extends StatelessWidget {
  List<Product> productList;

  BestSellerProducts(this.productList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 230,

        child: Padding(
          padding: const EdgeInsets.only(right: 33),
          child: ListView.builder(
            physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ProductItem(productList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
