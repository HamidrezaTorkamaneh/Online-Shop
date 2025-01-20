import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/category/category_bloc.dart';
import 'package:online_shop/bloc/category/category_event.dart';
import 'package:online_shop/bloc/category/category_state.dart';
import 'package:online_shop/data/repository/category_repository.dart';

import 'package:online_shop/widgets/custom_color.dart';
import 'package:online_shop/widgets/list_category.dart';
import 'package:online_shop/widgets/product_item.dart';

import '../data/model/my_category.dart';
import '../widgets/custom_app_bar1.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar1(text: 'دسته بندی'),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state is CategoryResponseState) {
                 return state.response.fold((l) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(l)),
                    );
                  }, (r) {
                    return ListCategory(list: r);
                  });
                }
                return SliverToBoxAdapter(
                  child: Center(child: Text('error')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
