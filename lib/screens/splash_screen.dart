import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:online_shop/screens/login_screen.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/loading_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds:5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.blueColor1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/iphone1.png', width: 100),
            SizedBox(height: 30),
            SizedBox(
              child: Text(
                'اپل شاپ',style: theme.textTheme.headline1!.apply(
                color: Colors.white,
                fontSizeDelta: 5
              ),
              ),
            ),
            SizedBox(height: 80),
            SizedBox(
              height: 30,
              width: 30,
              child: LoadingIndicator(
                indicatorType: Indicator.lineScale,
                colors: [Colors.white],
                strokeWidth: 3,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
