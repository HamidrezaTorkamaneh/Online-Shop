import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:online_shop/data/datasource/authentication_datasource.dart';
import 'package:online_shop/data/repository/authentication_repository.dart';

var locator=GetIt.instance;
Future<void> getItInit()async{
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://startflutter.ir/api/'))
  );
  
  //datasources
  
  locator.registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());


  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}