import 'package:flutter/material.dart';
import 'package:online_shop/widgets/color_variant_list.dart';
import 'package:online_shop/widgets/storage_variant_List.dart';

import '../data/model/product_variant.dart';
import '../data/model/variant.dart';

class VariantContainer extends StatelessWidget {
  List<ProductVariant> productVariantList;

  VariantContainer(this.productVariantList, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(44, 20, 44, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productVariantList[1].variantType.title!,
              style: theme.textTheme.headline1?.apply(
                fontSizeDelta: 1,
              ),
            ),
            SizedBox(height: 10),
            // ColorVariantList(productVariantList[0].variantList),
            StorageVariantList(productVariantList[1].variantList),
          ],
        ),
      ),
    );
  }
}


