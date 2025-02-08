import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/product_detail_datasource.dart';
import 'package:online_shop/data/model/product_image.dart';

import '../../di/di.dart';
import '../../util/api_exception.dart';

abstract class IDetailProductRepository {
  Future<Either<String,List<ProductImage>>> getProductImage();
}

class DetailProductRepository extends IDetailProductRepository{
  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async{
    final IDetailProductDatasource _datasource=locator.get();
    try {
      var response = await _datasource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }

}