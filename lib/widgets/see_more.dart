import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_icon.dart';
import 'custom_color.dart';

class SeeMore extends StatelessWidget {
  String text;

  SeeMore({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
        child: Row(
          children: [
            Text(
              text,
              style: theme.textTheme.headline3,
            ),
            Spacer(),
            Text(
              'مشاهده همه',
              style: theme.textTheme.headline3?.apply(
                color: CustomColor.blueColor,
              ),
            ),
            SizedBox(width: 10),
            CustomIcon(
                icon: 'left_arrow_circle',
                color: CustomColor.blueColor,
                size: 20),
          ],
        ),
      ),
    );
  }
}
