import 'package:dio/dio.dart';
import 'package:online_shop/data/model/product.dart';
import 'package:online_shop/util/api_exception.dart';

import '../../di/di.dart';

abstract class ICategoryProductDatasource {
  Future<List<Product>> getProductByCategoryId(String categoryId);
}

class CategoryProductRemoteDatasource extends ICategoryProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<Product>> getProductByCategoryId(String categoryId) async {
    try {
      Map<String, String> qParams = {'filter': 'category="$categoryId"'};
      Response<dynamic> response;
      if (categoryId == 'qnbj8d6b9lzzpn8') {
         response = await _dio.get('collections/products/records');
      }else{
         response = await _dio.get('collections/products/records',
            queryParameters: qParams);
      }

      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }
}
