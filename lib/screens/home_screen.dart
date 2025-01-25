import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/home/home_bloc.dart';
import 'package:online_shop/bloc/home/home_event.dart';
import 'package:online_shop/bloc/home/home_state.dart';
import 'package:online_shop/data/repository/banner_repository.dart';
import 'package:online_shop/widgets/category_list.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/see_more.dart';
import '../widgets/banner_slider.dart';
import '../widgets/category_items.dart';
import '../widgets/category_list_title.dart';
import '../widgets/product_item.dart';
import '../widgets/search_app_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitializeData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: CustomColor.backGroundColor,
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
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              if (state is HomeLoadingState) ...[
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
              SearchAppBar(),
              if (state is HomeRequestSuccessState) ...[
                state.bannerList.fold((exceptionMessage) {
                  return SliverToBoxAdapter(
                    child: Text(exceptionMessage),
                  );
                }, (listBanners) {
                  return BannerSlider(listBanners);
                })
              ],
              if (state is HomeRequestSuccessState) ...[
                state.categoryList.fold((exceptionMessage) {
                  return SliverToBoxAdapter(
                    child: Text(exceptionMessage),
                  );
                }, (categoryList) {
                  return CategoryListTitle(categoryList);
                })
              ],
              SeeMore(text: 'پر فروش ترین ها'),
              CategoryList(),
              SeeMore(text: 'پر بازدید ترین ها'),
              CategoryList(),
            ],
          );
        },
      )),
    );
  }
}
