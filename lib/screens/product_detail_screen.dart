import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/product/product_bloc.dart';
import 'package:online_shop/bloc/product/product_event.dart';
import 'package:online_shop/bloc/product/product_state.dart';
import 'package:online_shop/data/model/product.dart';
import 'package:online_shop/widgets/Custom_icon.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/price_tag_button.dart';
import 'package:online_shop/widgets/product_properties.dart';
import '../widgets/add_to_basket_button.dart';
import '../widgets/detail_of_product.dart';
import '../widgets/gallery_widget.dart';
import '../widgets/variant_container_generator.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;

  ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {


  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(
        ProductInitializeEvent(widget.product.id, widget.product.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: ((context, state) {
          return SafeArea(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
              slivers: [
                if (state is ProductDetailLoadingState) ...[
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                ],
                if (state is ProductDetailResponseState) ...{
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.symmetric(horizontal: 44, vertical: 25),
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          CustomIcon(icon: 'right_arrow_circle1', color: Colors.black, size: 25,onTap: (){
                            Navigator.of(context).pop();
                          },),
                          Expanded(
                            child: state.productCategory.fold((l) {
                              return Text(
                                'دسته بندی',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headline1
                                    ?.apply(color: CustomColor.blueColor,
                                    fontSizeDelta: 3),
                              );

                            }, (productCategory) {
                              return Text(productCategory.title!,textAlign: TextAlign.center,
                                style: theme.textTheme.headline1
                                    ?.apply(color: CustomColor.blueColor,
                                    fontSizeDelta:1),);
                            })
                          ),
                          CustomIcon(icon: 'apple', color: CustomColor.blueColor, size: 25),
                        ],
                      ),
                    ),
                  ),
                },
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.product.name,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline1?.apply(
                        fontSizeDelta: 5,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 20),
                if (state is ProductDetailResponseState) ...[
                  state.productImages.fold((exceptionMessage) {
                    return SliverToBoxAdapter(
                      child: Text(exceptionMessage),
                    );
                  }, (productImageList) {
                    return GalleryWidget(
                        widget.product.thumbnail, productImageList);
                  })
                ],

                if (state is ProductDetailResponseState) ...[
                  state.productVariant.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (productVariantList) {
                    return VariantContainerGenerator(productVariantList);
                  })
                ],


                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      if(state is ProductDetailResponseState)...{
                        state.productProperties.fold((l) {
                          return SliverToBoxAdapter(
                            child: Text(l),
                          );
                        }, (propertyList) {
                          return ProductProperties(propertyList);
                        })
                      },
                      DetailOfProduct(specification: widget.product.description),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 44, vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: 340,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1, color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'نظرات کاربران:',
                              style: theme.textTheme.headline1?.apply(
                                fontSizeDelta: 2,
                              ),
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 20,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 30,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 40,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '۱۰+',
                                        style: theme.textTheme.headline1
                                            ?.apply(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                      ),
                    ],
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 10)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddToBasketButton(),
                        PriceTagButoon(),
                      ],
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
