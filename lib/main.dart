import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_shop/bloc/authentication/auth_bloc.dart';
import 'package:online_shop/bloc/card/card_bloc.dart';
import 'package:online_shop/bloc/card/card_event.dart';
import 'package:online_shop/bloc/category/category_bloc.dart';
import 'package:online_shop/bloc/home/home_bloc.dart';
import 'package:online_shop/bloc/home/home_event.dart';
import 'package:online_shop/data/model/card_item.dart';
import 'package:online_shop/screens/category_screen.dart';
import 'package:online_shop/screens/login_screen.dart';
import 'package:online_shop/screens/profile_screen.dart';
import 'package:online_shop/screens/shopping_cart_screen.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'di/di.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CardItemAdapter());
  await Hive.openBox<CardItem>('CardBox');
  await getItInit();

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
            fontSize: 12,
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
        body:
        IndexedStack(
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
                color: CustomColor.blueColor2,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: 'YB',
                fontSize: 10,
                color: Colors.black,
              ),
              selectedItemColor: CustomColor.blueColor2,
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: CustomIcon(icon: 'home', color: Colors.black, size: 25),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 3),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: CustomColor.blueColor2,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_home',
                        color: CustomColor.blueColor2,
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
                        color: CustomColor.blueColor2,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_category',
                        color: CustomColor.blueColor2,
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
                        color: CustomColor.blueColor2,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_basket',
                        color: CustomColor.blueColor2,
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
                        color: CustomColor.blueColor2,
                        blurRadius: 20,
                        spreadRadius: -7,
                        offset: Offset(0.0, 13),
                      )
                    ]),
                    child: CustomIcon(
                        icon: 'active_user',
                        color: CustomColor.blueColor2,
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
    BlocProvider(
      create: (context) {
        var bloc = HomeBloc();
        bloc.add(HomeGetInitializeData());
        return bloc;
      },
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (context) => CategoryBloc(),
      child: CategoryScreen(),
    ),
    BlocProvider(
      create: (context) {
        var bloc = locator.get<CardBloc>();
        bloc.add(
          CardFetchFromHiveEvent(),
        );
        return bloc;
      },
      child: ShoppingCartScreen(),
    ),
    ProfileScreen(),
  ];
}
