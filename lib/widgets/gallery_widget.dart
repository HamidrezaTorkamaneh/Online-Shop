import 'package:flutter/material.dart';
import 'package:online_shop/widgets/cached_image.dart';

import '../data/model/product_image.dart';
import 'Custom_icon.dart';
import 'custom_color.dart';

class GalleryWidget extends StatefulWidget {
  List<ProductImage> productImageList;
  String? defaultProductThumbnail;

  int selectedItem = 0;

  GalleryWidget(this.defaultProductThumbnail, this.productImageList,
      {super.key});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 44),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
        height: 284,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: -20,
              offset: Offset(0.0, 3),
              color: Colors.black,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIcon(
                    icon: 'active_fav', color: CustomColor.greyColor, size: 20),
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Center(
                      child: CachedImage(
                          imageUrl: (widget.productImageList.isEmpty)
                              ? widget.defaultProductThumbnail
                              : widget.productImageList[widget.selectedItem]
                                  .imageUrl),
                    )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        '۴.۶',
                        style:
                            theme.textTheme.headline1?.apply(fontSizeDelta: 1),
                      ),
                    ),
                    // SizedBox(width: 5),
                    CustomIcon(
                        icon: 'star', color: CustomColor.goldColor, size: 20),
                  ],
                )
              ],
            ),
            Spacer(),
            if (widget.productImageList.isNotEmpty) ...{
              SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productImageList.length,
                    itemBuilder: (context, index) {
                      return Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              widget.selectedItem = index;
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                              ),
                              child: Center(
                                  child: CachedImage(
                                imageUrl:
                                    widget.productImageList[index].imageUrl,
                                radius: 10,
                              ))),
                        ),
                      );
                    },
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}
