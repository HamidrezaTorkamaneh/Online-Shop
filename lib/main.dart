import 'package:flutter/material.dart';
import 'package:online_shop/widgets/banner_slider.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: BannerSlider(),
        ),
      ),
    );
  }
}
