import 'package:dartz/dartz.dart';
import 'package:online_shop/data/model/product.dart';

abstract class CategoryProductState {}

class CategoryProductLoadingState extends CategoryProductState {}

class CategoryProductResponseSuccessState extends CategoryProductState {
  Either<String, List<Product>> productListByCategory;

  CategoryProductResponseSuccessState(this.productListByCategory);
}
