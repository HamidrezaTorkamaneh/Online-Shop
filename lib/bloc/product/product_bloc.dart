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
        var productImages = await _productRepository.getProductImage();
        var productVariant = await _productRepository.getProductVariants();
        emit(ProductDetailResponseState(productImages, productVariant));
      },
    );
  }
}
