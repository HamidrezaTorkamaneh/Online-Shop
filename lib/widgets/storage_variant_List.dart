import 'package:flutter/material.dart';
import 'package:online_shop/widgets/custom_color.dart';
import '../data/model/variant.dart';

class StorageVariantList extends StatefulWidget {
  List<Variant> storageVariants;

  StorageVariantList(this.storageVariants, {super.key});

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.storageVariants.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10),
            height: 25,
            decoration: BoxDecoration(
              border: (selectedIndex == index)
                  ? Border.all(
                      width: 2,
                      color: CustomColor.blueColor2,
                      strokeAlign: BorderSide.strokeAlignOutside)
                  : Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      widget.storageVariants[index].value!,
                      style: TextStyle(
                        fontFamily: 'YB',
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
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
