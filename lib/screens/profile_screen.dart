import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/category_items.dart';
import 'package:online_shop/widgets/custom_color.dart';

import '../data/datasource/authentication_datasource.dart';
import '../widgets/custom_app_bar1.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar1(text: 'حساب کاربری'),
            SizedBox(height: 30),
            Text('محمد جواد هاشمی',
                style: theme.textTheme.headline1?.apply(fontSizeDelta: 5)),
            SizedBox(height: 5),
            Text(
              '۰۹۱۲۳۴۵۶۷۸۹',
              style: theme.textTheme.headline2
                  ?.apply(color: CustomColor.greyColor),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
                CategoryItems(),
              ],
            ),


            Spacer(),
            Text(
              'اپل شاپ',
              style: theme.textTheme.headline2
                  ?.apply(color: CustomColor.greyColor),
            ),
            SizedBox(height: 5),
            Text(
              'v-1.0.00',
              style: theme.textTheme.headline2
                  ?.apply(color: CustomColor.greyColor),
            ),
            SizedBox(height: 5),
            Text(
              'Instagram.com/Mojavad-dev',
              style: theme.textTheme.headline2
                  ?.apply(color: CustomColor.greyColor),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
