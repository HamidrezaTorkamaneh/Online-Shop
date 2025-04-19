import 'package:flutter/material.dart';
import '../data/model/property.dart';
import 'Custom_icon.dart';
import 'custom_color.dart';

class ProductProperties extends StatefulWidget{
  List<Property> productPropertyList;
  ProductProperties(this.productPropertyList,{super.key});

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
  bool _isVisible=false;

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
                        'مشخصات فنی',
                        style: theme.textTheme.headline1?.apply(
                          fontSizeDelta: 2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'مشاهده',
                        style: theme.textTheme.headline1?.apply(
                          fontSizeDelta: 2,
                          color: CustomColor.blueColor2,
                        ),
                      ),
                      SizedBox(width: 5),
                      CustomIcon(
                          icon: 'left_arrow_circle',
                          color: CustomColor.blueColor2,
                          size: 20),
                    ],
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.productPropertyList.length,
                            itemBuilder: (context, index) {
                            var property=widget.productPropertyList[index];
                            return Row(
                              children: [
                                Text('${property.title!}:${property.value!}',style: theme.textTheme.headline1?.apply(
                                  fontSizeDelta: 2,
                                  heightFactor: 1.5,
                                ),
                                  textAlign: TextAlign.justify,),
                              ],
                            );
                          },)

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