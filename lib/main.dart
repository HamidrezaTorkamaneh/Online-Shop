import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/screens/category_screen.dart';
import 'package:online_shop/screens/main_screen.dart';
import 'package:online_shop/screens/product_detail_screen.dart';
import 'package:online_shop/screens/profile_screen.dart';
import 'package:online_shop/screens/shopping_cart_screen.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/banner_slider.dart';
import 'package:online_shop/widgets/category_items.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
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
          ),

        ),
      ),
      home: Scaffold(
        backgroundColor: CustomColor.backGroundColor,
        body: IndexedStack(
          index: selectedBottomNavigationIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationIndex = index;
                });
              },
              currentIndex: selectedBottomNavigationIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedLabelStyle: TextStyle(
                fontFamily: 'YB',
                fontSize: 10,
                color: CustomColor.blueColor,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'YB',
                fontSize: 10,
                color: Colors.black,
              ),
              selectedItemColor: CustomColor.blueColor,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: CustomIcon(icon: 'home', color: Colors.black, size: 25),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: CustomColor.blueColor,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_home',
                        color: CustomColor.blueColor,
                        size: 25),
                  ),
                  label: 'خانه',
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(
                      icon: 'category', color: Colors.black, size: 25),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: CustomColor.blueColor,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_category',
                        color: CustomColor.blueColor,
                        size: 25),
                  ),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon:
                      CustomIcon(icon: 'basket', color: Colors.black, size: 25),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: CustomColor.blueColor,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_basket',
                        color: CustomColor.blueColor,
                        size: 25),
                  ),
                  label: 'سبد خرید',
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(icon: 'user', color: Colors.black, size: 25),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: CustomColor.blueColor,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_user',
                        color: CustomColor.blueColor,
                        size: 25),
                  ),
                  label: 'حساب کاربری',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreens() {
  return <Widget>[
    MainScreen(),
    CategoryScreen(),
    ShoppingCartScreen(),
    ProfileScreen(),
  ];
}
