import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/product_detail_datasource.dart';
import 'package:online_shop/data/model/product_image.dart';
import 'package:online_shop/data/model/variant_type.dart';
import '../../di/di.dart';
import '../../util/api_exception.dart';
import '../model/product_variant.dart';


abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();

  Future<Either<String, List<VariantType>>> getVariantTypes();

  Future<Either<String, List<ProductVariant>>> getProductVariants();
}

class DetailProductRepository extends IDetailProductRepository {
  final IDetailProductDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async {
    try {
      var response = await _datasource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantTypes() async {
    try {
      var response = await _datasource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariants()async {
    try {
      var response = await _datasource.getProductVariants();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }



}
