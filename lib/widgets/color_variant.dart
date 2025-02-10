import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/data/model/variant_type.dart';
import 'package:online_shop/widgets/select_color.dart';

class ColorVariant extends StatelessWidget{
  VariantType variantType;
  ColorVariant(this.variantType,{super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(44, 20, 44, 20),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            Text(
              variantType.title!,
              style: theme.textTheme.headline1?.apply(
                fontSizeDelta: 1,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SelectColor(),
                SelectColor(),
                SelectColor(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}