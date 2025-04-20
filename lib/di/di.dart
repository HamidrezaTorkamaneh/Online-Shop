import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_shop/bloc/card/card_bloc.dart';
import 'package:online_shop/data/datasource/authentication_datasource.dart';
import 'package:online_shop/data/datasource/banner_datasource.dart';
import 'package:online_shop/data/datasource/basket_datasource.dart';
import 'package:online_shop/data/datasource/category_datasource.dart';
import 'package:online_shop/data/datasource/category_product_datasource.dart';
import 'package:online_shop/data/datasource/comment_datasource.dart';
import 'package:online_shop/data/datasource/product_datasource.dart';
import 'package:online_shop/data/datasource/product_detail_datasource.dart';
import 'package:online_shop/data/repository/authentication_repository.dart';
import 'package:online_shop/data/repository/banner_repository.dart';
import 'package:online_shop/data/repository/basket_repository.dart';
import 'package:online_shop/data/repository/category_product_repository.dart';
import 'package:online_shop/data/repository/category_repository.dart';
import 'package:online_shop/data/repository/comment_repository.dart';
import 'package:online_shop/data/repository/product_detail_repository.dart';
import 'package:online_shop/data/repository/product_repository.dart';
import 'package:online_shop/util/dio_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  //components
  locator.registerSingleton<Dio>(DioProvider().createDio());



  //datasources

  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());

  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());

  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());

  locator.registerFactory<IProductDatasource>(() => ProductRemoteDatasource());

  locator.registerFactory<IDetailProductDatasource>(
      () => DetailProductRemoteDatasource());

  locator.registerFactory<ICategoryProductDatasource>(
      () => CategoryProductRemoteDatasource());

  locator.registerFactory<IBasketDatasource>(
          () => BasketLocalDatasource());

  locator.registerFactory<ICommentDatasource>(
          () => CommentRemoteDatasource());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());

  locator.registerFactory<IBannerRepository>(() => BannerRepository());

  locator.registerFactory<IProductRepository>(() => ProductRepository());

  locator.registerFactory<IDetailProductRepository>(
      () => DetailProductRepository());

  locator.registerFactory<ICategoryProductRepository>(
      () => CategoryProductRepository());

  locator.registerFactory<IBasketRepository>(
          () => BasketRepository());

  locator.registerFactory<ICommentRepository>(
          () => CommentRepository());


  //bloc
  locator.registerSingleton<CardBloc>(CardBloc());
}
