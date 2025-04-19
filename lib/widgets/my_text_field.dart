import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_color.dart';

class MyTextField extends StatelessWidget {
  String text;
  TextEditingController ?controller=TextEditingController();

  MyTextField({super.key,required this.text,this.controller});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return TextField(
      controller: controller,
      style: theme.textTheme.headline1?.apply(
        fontSizeDelta: 4,
      ),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: theme.textTheme.headline1?.apply(
          fontSizeDelta: 2,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
          BorderSide(width: 2, color: CustomColor.blueColor2),
        ),
        border: InputBorder.none,
      ),
    );
  }

}