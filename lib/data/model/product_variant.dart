import 'package:online_shop/data/model/variant.dart';
import 'package:online_shop/data/model/variant_type.dart';

class ProductVariant {
  VariantType variantType;
  List<Variant> variantList;

  ProductVariant(this.variantType, this.variantList);



}
