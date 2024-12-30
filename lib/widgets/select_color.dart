import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectColor extends StatelessWidget {
  SelectColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),
    );

  }
}