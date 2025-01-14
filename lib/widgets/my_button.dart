import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_color.dart';

class MyButton extends StatelessWidget{
  String text;
  Color color;
  void Function()? onTap;

  MyButton({super.key,required this.text,required this.color,this.onTap});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme=Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 44,vertical: 20),
      height: 53,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Center(
            child: Text(text,style: theme.textTheme.headline1?.apply(
              color: Colors.white,
              fontSizeDelta: 3,
            ),),
          ),
        ),
      ),
    );
  }
}