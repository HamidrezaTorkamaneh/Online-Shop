import 'package:dio/dio.dart';
import 'package:online_shop/util/auth_manager.dart';

class DioProvider {
  Dio createDio() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/', headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${AuthManager.readAuth()}'
      }),
    );
    return dio;
  }
}
