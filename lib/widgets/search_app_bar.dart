import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class SearchAppBar extends StatelessWidget {
  SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 44, vertical: 25),
        height: 46,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CustomIcon(icon: 'search', color: Colors.black, size: 25),
            SizedBox(width: 10),
            Text(
              'جستجوی محصولات',
              style:
                  theme.textTheme.headline1?.apply(color: CustomColor.greyColor),
            ),
            Spacer(),
            CustomIcon(icon: 'apple', color: CustomColor.blueColor2, size: 25),
          ],
        ),
      ),
    );
  }
}
