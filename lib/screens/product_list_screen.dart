import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:online_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:online_shop/bloc/categoryProduct/category_product_state.dart';
import 'package:online_shop/data/model/category.dart';
import 'package:online_shop/widgets/product_item.dart';
import '../widgets/Custom_icon.dart';
import '../widgets/custom_color.dart';

class ProductListScreen extends StatefulWidget {
  Category category;

  ProductListScreen(this.category, {super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(context)
        .add(CategoryProductInitialize(widget.category.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: CustomColor.backGroundColor,
              systemNavigationBarColor: CustomColor.backGroundColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        backgroundColor: CustomColor.backGroundColor,
        body: BlocBuilder<CategoryProductBloc,CategoryProductState>(
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.fast),
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(horizontal: 44, vertical: 25),
                      height: 46,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          CustomIcon(
                            icon: 'right_arrow_circle1',
                            color: Colors.black,
                            size: 25,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Expanded(
                            child: Text(
                              widget.category.title!,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headline1?.apply(
                                  color: CustomColor.blueColor2,
                                  fontSizeDelta: 3),
                            ),
                          ),
                          CustomIcon(
                              icon: 'apple',
                              color: CustomColor.blueColor2,
                              size: 25),
                        ],
                      ),
                    ),
                  ),
                  if(state is CategoryProductLoadingState)...{
                    SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )

                  },
                  if(state is CategoryProductResponseSuccessState)...{
                    state.productListByCategory.fold((l) {
                     return SliverToBoxAdapter(
                        child: Text(l),
                      );

                    }, (productList) {
                      return SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 44),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            return ProductItem(productList[index]);
                          },childCount: productList.length),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.8,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                        ),
                      );
                    })
                  }
                ],
              ),
            );
          },
        ));
  }
}
