import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/widgets/banner_slider.dart';
import 'package:online_shop/widgets/category_items.dart';

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
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              BannerSlider(),
              SizedBox(height: 32),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: 5,
                    itemBuilder: (context, index) {
                    return CategoryItems();
                  },),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
