import 'package:dio/dio.dart';
import 'package:online_shop/di/di.dart';

import '../../util/api_exception.dart';
import '../model/product_image.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallery();
}

class DetailProductRemoteDatasource extends IDetailProductDatasource{
  final Dio _dio= locator.get();
  @override
  Future<List<ProductImage>> getGallery() async {
    try {
    Map<String,String> qParams={
    'filter':'product_id="at0y1gm0t65j62j"'
    };
      var response = await _dio.get('collections/gallery/records',queryParameters: qParams);

      return response.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

}