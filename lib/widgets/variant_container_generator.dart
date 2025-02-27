import 'package:flutter/material.dart';
import 'package:online_shop/widgets/color_variant_list.dart';
import 'package:online_shop/widgets/storage_variant_List.dart';
import 'package:online_shop/widgets/variant_generator_child.dart';

import '../data/model/product_variant.dart';
import '../data/model/variant.dart';

class VariantContainerGenerator extends StatelessWidget {
  List<ProductVariant> productVariantList;

  VariantContainerGenerator(this.productVariantList, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(var productVariant in productVariantList)...{
              if(productVariant.variantList.isNotEmpty)...{
                VariantGeneratorChild(productVariant)
              }

            }
          ],
        ),
      ),
    );
  }
}


