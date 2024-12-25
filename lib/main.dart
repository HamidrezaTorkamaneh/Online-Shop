import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/screens/main_screen.dart';
import 'package:online_shop/widgets/banner_slider.dart';
import 'package:online_shop/widgets/category_items.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/produce_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'YB',
              fontSize: 10,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontFamily: 'YM',
              fontSize: 10,
              color: Colors.black,
            ),
            headline3: TextStyle(
              fontFamily: 'YB',
              fontSize: 10,
              color: CustomColor.greyColor,
            )
          ),
        ),
        home: Scaffold(
          backgroundColor: CustomColor.backGroundColor,
          body: Center(
              child: MainScreen()),
        ));
  }
}
