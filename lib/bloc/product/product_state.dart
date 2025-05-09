import 'package:dartz/dartz.dart';
import 'package:online_shop/data/model/category.dart';
import 'package:online_shop/data/model/product_variant.dart';
import 'package:online_shop/data/model/property.dart';
import '../../data/model/product_image.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVariant>> productVariant;
  Either<String, Category> productCategory;
  Either<String, List<Property>> productProperties;

  ProductDetailResponseState(this.productImages, this.productVariant ,this.productCategory,this.productProperties);
}
