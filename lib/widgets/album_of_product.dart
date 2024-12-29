import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumOfProduct extends StatelessWidget {
  const AlbumOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Image.asset(
        'assets/images/iphone.png',
      ),
    );
  }
}
