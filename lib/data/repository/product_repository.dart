import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/product_datasource.dart';
import 'package:online_shop/util/api_exception.dart';
import '../../di/di.dart';
import '../model/product.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, List<Product>>> getHotest();
  Future<Either<String, List<Product>>> getBestSeller();
}

class ProductRepository extends IProductRepository {
  final IProductDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      var response = await _datasource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getBestSeller() async{
    try{
      var response= await  _datasource.getBestSeller();
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getHotest() async{
    try{
      var response= await _datasource.getHotest();
      return right(response);
    }on ApiException catch(ex){
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }
}
