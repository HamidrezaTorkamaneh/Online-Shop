import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  String icon;
  Color color;
  double size;
  void Function()? onTap;

  CustomIcon(
      {super.key, required this.icon, required this.color, required this.size,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          'assets/images/icon_${icon}.svg',
          width: size,
          height: size,
          color: color,
        ),
      ),
    );
  }
}
