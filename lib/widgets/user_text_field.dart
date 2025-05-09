import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_color.dart';

class UserTextField extends StatelessWidget {
  String text;
  Icon ?icon;
  TextEditingController ?controller=TextEditingController();

  UserTextField({super.key,required this.text,this.controller,this.icon});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return TextField(
      controller: controller,
      style: theme.textTheme.headline1?.apply(
        fontSizeDelta: 4,
      ),


      decoration: InputDecoration(

        prefixIcon: icon,
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