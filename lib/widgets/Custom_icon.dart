import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  String icon;
  Color color;
  double size;

  CustomIcon(
      {super.key, required this.icon, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/icon_${icon}.svg',
      width: size,
      height: size,
      color: color,
    );
  }
}
