import 'package:flutter/material.dart';
import '../data/model/variant.dart';

class StorageVariantList extends StatefulWidget {
  List<Variant> storageVariants;

  StorageVariantList(this.storageVariants, {super.key});

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {

  List<Widget> storageWidgetList = [];

  @override
  void initState() {

    for (var storageVariant in widget.storageVariants) {
      var item = Container(
        margin: EdgeInsets.only(left: 10),
        height: 25,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              storageVariant.value!,
            style:  TextStyle(
                fontFamily: 'YB',

                fontSize: 10,
                color: Colors.black,
              ),

            ),
          ),
        ),
      );
      storageWidgetList.add(item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storageWidgetList.length,
        itemBuilder: (context, index) {
          return storageWidgetList[index];
        },
      ),
    );
  }
}
