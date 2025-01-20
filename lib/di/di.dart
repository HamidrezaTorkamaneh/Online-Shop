import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_shop/data/datasource/authentication_datasource.dart';
import 'package:online_shop/data/datasource/banner_datasource.dart';
import 'package:online_shop/data/datasource/category_datasource.dart';
import 'package:online_shop/data/repository/authentication_repository.dart';
import 'package:online_shop/data/repository/banner_repository.dart';
import 'package:online_shop/data/repository/category_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //components
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/')));

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  //datasources

  locator
      .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());

  locator
      .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());

  locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());

  locator.registerFactory<IBannerRepository>(() => BannerRepository());
}
