import 'package:dio/dio.dart';

class DioProvider {
  Dio createDio() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/', headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE3NDYyOTc5ODIsImlkIjoicWY0a3p0cjc5b253ZXZrIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.qqR00ZrjPjuCX2Jk0l5PaRsMubyLtQ_E99YPlxlPnHE'
      }),
    );
    return dio;
  }
}
