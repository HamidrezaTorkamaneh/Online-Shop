import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_shop/bloc/authentication/auth_bloc.dart';
import 'package:online_shop/bloc/home/home_event.dart';
import 'package:online_shop/data/model/card_item.dart';
import 'package:online_shop/screens/dashboard_screen.dart';
import 'package:online_shop/screens/login_screen.dart';
import 'package:online_shop/util/auth_manager.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'di/di.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: globalNavigatorKey,
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
      home:
          (AuthManager.readAuth().isEmpty) ? LoginScreen() : DashBoardScreen(),
    );
  }
}
