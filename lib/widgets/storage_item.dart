import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StorageItem extends StatelessWidget {
  String storage;

  StorageItem({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 76,
      height: 26,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
        storage,
          style: theme.textTheme.headline2?.apply(
            fontFamily: 'YB',
          ),
        ),
      ),
    );
  }
}
