import 'package:dartz/dartz.dart';
import 'package:online_shop/data/model/product.dart';
import '../../data/model/banner.dart';
import '../../data/model/category.dart';


abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampaign>> bannerList;
  Either<String, List<Category>> categoryList;
  Either<String, List<Product>> productList;
  Either<String, List<Product>> hotestProductList;
  Either<String, List<Product>> bestSellerProductList;
  HomeRequestSuccessState(this.bannerList, this.categoryList,this.productList,this.bestSellerProductList,this.hotestProductList);
}

