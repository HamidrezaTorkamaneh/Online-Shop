import 'package:dio/dio.dart';
import 'package:online_shop/data/model/product_variant.dart';
import 'package:online_shop/data/model/variant_type.dart';
import 'package:online_shop/di/di.dart';

import '../../util/api_exception.dart';
import '../model/product_image.dart';
import '../model/variant.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallery();

  Future<List<VariantType>> getVariantTypes();

  Future<List<Variant>> getVariant();

  Future<List<ProductVariant>> getProductVariants();
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
      var response = await _dio.get('collections/gallery/records',
          queryParameters: qParams);

      return response.data['items']
          .map<ProductImage>(
              (jsonObject) => ProductImage.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var response = await _dio.get('collections/variants_type/records');

      return response.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
      var response = await _dio.get('collections/variants/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant();

    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variantListProduct = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();
      
      productVariantList.add(ProductVariant(variantType, variantList));
    }

    return productVariantList;
  }
}
