import 'package:flutter/cupertino.dart';

import '../data/model/variant.dart';

class ColorVariantList extends StatefulWidget{
  List<Variant> colorVariants;
  ColorVariantList(this.colorVariants,{super.key});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  List<Widget> colorWidgets = [];
  @override
  void initState() {
    for (var colorVariant in widget.colorVariants) {
      String categoryColor = 'ff${colorVariant.value}';
      int hexColor = int.parse(categoryColor, radix: 16);
      var item = Container(
        margin: EdgeInsets.only(left: 10),
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(hexColor),
        ),
      );
      colorWidgets.add(item);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorWidgets.length,
        itemBuilder: (context, index) {
        return colorWidgets[index];
      },),
    );
  }
}