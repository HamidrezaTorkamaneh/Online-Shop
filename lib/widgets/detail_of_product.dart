import 'package:flutter/material.dart';
import 'Custom_icon.dart';
import 'custom_color.dart';

class DetailOfProduct extends StatefulWidget {
  String specification;

  DetailOfProduct({super.key, required this.specification});

  @override
  State<DetailOfProduct> createState() => _DetailOfProductState();
}

class _DetailOfProductState extends State<DetailOfProduct> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            onTap: (){
              setState(() {
                _isVisible=!_isVisible;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.black),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'توضیحات محصول',
                        style: theme.textTheme.headline1?.apply(
                          fontSizeDelta: 2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'مشاهده',
                        style: theme.textTheme.headline1?.apply(
                          fontSizeDelta: 2,
                          color: CustomColor.blueColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      CustomIcon(
                          icon: 'left_arrow_circle',
                          color: CustomColor.blueColor,
                          size: 20),
                    ],
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          widget.specification,
                          style: theme.textTheme.headline1?.apply(
                            fontSizeDelta: 2,
                            heightFactor: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}
