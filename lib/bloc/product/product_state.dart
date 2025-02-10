import 'package:dartz/dartz.dart';
import 'package:online_shop/data/model/product_variant.dart';
import 'package:online_shop/data/model/variant_type.dart';

import '../../data/model/product_image.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVariant>> productVariant;

  ProductDetailResponseState(this.productImages, this.productVariant);
}
