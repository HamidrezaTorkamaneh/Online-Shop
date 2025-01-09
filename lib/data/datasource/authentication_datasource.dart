import 'package:dio/dio.dart';
import 'package:online_shop/util/api_exception.dart';

import '../../di/di.dart';

abstract class IAuthenticationDatasource{
  Future<void> register(String username, String password, String passwordConfirm);
}

class AuthenticationRemote implements IAuthenticationDatasource{
  final Dio _dio=locator.get();

  @override
  Future<void> register(String username, String password, String passwordConfirm) async{
    try{
          final response = await _dio.post('collections/users/records', data: {
            'username': username,
            'password': password,
            'passwordConfirm': passwordConfirm,
          });
        }on DioError catch(ex){
          throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
        }catch (ex){
         throw ApiException(0, 'unknow error');
        }
  }




}
