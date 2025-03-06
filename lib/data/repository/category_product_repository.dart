import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/category_product_datasource.dart';
import 'package:online_shop/data/model/product.dart';
import 'package:online_shop/di/di.dart';
import 'package:online_shop/util/api_exception.dart';

abstract class ICategoryProductRepository {
  Future<Either<String,List<Product>>> getProductByCategoryId(String categoryId);
}

class CategoryProductRepository extends ICategoryProductRepository{
  final ICategoryProductDatasource _datasource=locator.get();
  @override
  Future<Either<String, List<Product>>> getProductByCategoryId(String categoryId) async{
    try{
      var response =await _datasource.getProductByCategoryId(categoryId);
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message??'خطا محتوا متنی ندار');
    }
  }
  
}