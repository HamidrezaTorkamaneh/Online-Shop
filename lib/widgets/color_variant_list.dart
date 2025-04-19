import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/custom_color.dart';

import '../data/model/variant.dart';

class ColorVariantList extends StatefulWidget {
  List<Variant> colorVariants;

  ColorVariantList(this.colorVariants, {super.key});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.colorVariants.length,
        itemBuilder: (context, index) {
          String categoryColor = 'ff${widget.colorVariants[index].value}';
          int hexColor = int.parse(categoryColor, radix: 16);
          return Container(
            padding: EdgeInsets.all(1.5),
            margin: EdgeInsets.only(left: 10),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: (selectedIndex == index)
                  ? Border.all(
                      width: 1,
                      color: CustomColor.blueColor2,
                      strokeAlign: BorderSide.strokeAlignOutside)
                  : Border.all(width: 1.5, color: Colors.white),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(hexColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
