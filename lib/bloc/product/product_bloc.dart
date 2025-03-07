import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/product/product_event.dart';
import 'package:online_shop/bloc/product/product_state.dart';
import 'package:online_shop/di/di.dart';
import '../../data/repository/product_detail_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();

  ProductBloc() : super(ProductInitState()) {
    on<ProductInitializeEvent>(
      (event, emit) async {
        emit(ProductDetailLoadingState());
        var productImages = await _productRepository.getProductImage(event.productId);
        var productVariant = await _productRepository.getProductVariants(event.productId);
        var productCategory = await _productRepository.getProductCategory(event.categoryId);
        var productProperties = await _productRepository.getProductProperties(event.productId);
        emit(ProductDetailResponseState(productImages, productVariant,productCategory,productProperties));
      },
    );
  }
}
