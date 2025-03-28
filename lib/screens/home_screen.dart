import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/home/home_bloc.dart';
import 'package:online_shop/bloc/home/home_event.dart';
import 'package:online_shop/bloc/home/home_state.dart';
import 'package:online_shop/widgets/category_list.dart';
import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/loading_indicator_widget.dart';
import 'package:online_shop/widgets/most_view_products.dart';
import 'package:online_shop/widgets/see_more.dart';
import '../widgets/banner_slider.dart';
import '../widgets/category_list_title.dart';
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
          return _getHomeScreenContent(state,context);
        },
      )),
    );
  }
}

Widget _getHomeScreenContent(HomeState state, BuildContext context) {
  if (state is HomeLoadingState) {
    return const Center(
      child: LoadingIndicatorWidget(),
    );
  } else if (state is HomeRequestSuccessState) {
    return RefreshIndicator(
      onRefresh: ()async{
       context.read<HomeBloc>().add(HomeGetInitializeData());

      },
      child: CustomScrollView(
        physics:
            BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        slivers: [
          SearchAppBar(),
          state.bannerList.fold((exceptionMessage) {
            return SliverToBoxAdapter(
              child: Text(exceptionMessage),
            );
          }, (listBanners) {
            return BannerSlider(listBanners);
          }),
          state.categoryList.fold((exceptionMessage) {
            return SliverToBoxAdapter(
              child: Text(exceptionMessage),
            );
          }, (categoryList) {
            return CategoryListTitle(categoryList);
          }),
          SeeMore(text: 'پر فروش ترین ها'),
          state.bestSellerProductList.fold((exceptionMessage) {
            return SliverToBoxAdapter(
              child: Text(exceptionMessage),
            );
          }, (productList) {
            return BestSellerProducts(productList);
          }),
          SeeMore(text: 'پر بازدید ترین ها'),
          state.hotestProductList.fold((exceptionMessage) {
            return SliverToBoxAdapter(child: Text(exceptionMessage));
          }, (productList) {
            return MostViewProducts(productList);
          })
        ],
      ),
    );
  } else {
    return Center(child: Text('خطا در دریافت اطلاعات به وجود آمده!'));
  }
}
