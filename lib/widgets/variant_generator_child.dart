import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/model/variant_type.dart';
import 'package:online_shop/widgets/color_variant_list.dart';
import 'package:online_shop/widgets/storage_variant_List.dart';

import '../data/model/product_variant.dart';

class VariantGeneratorChild extends StatelessWidget {
  ProductVariant productVariant;

  VariantGeneratorChild(this.productVariant, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productVariant.variantType.title!,
            style: theme.textTheme.headline1?.apply(
              fontSizeDelta: 1,
            ),
          ),
          const SizedBox(height: 10),
          if (productVariant.variantType.type == VariantTypeEnum.COLOR) ...{
            ColorVariantList(productVariant.variantList)
        },
          if (productVariant.variantType.type == VariantTypeEnum.STORAGE) ...{
            StorageVariantList(productVariant.variantList)
          }
        ],
      ),
    );
  }
}
