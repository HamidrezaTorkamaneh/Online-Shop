import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/categoryProduct/category_product_event.dart';
import 'package:online_shop/bloc/categoryProduct/category_product_state.dart';
import 'package:online_shop/data/repository/category_product_repository.dart';
import '../../di/di.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final ICategoryProductRepository _repository = locator.get();

  CategoryProductBloc() :super(CategoryProductLoadingState()) {
    on<CategoryProductInitialize>((event, emit) async {
       var response= await _repository.getProductByCategoryId(event.categoryId);
       emit(CategoryProductResponseSuccessState(response));
    });
  }

}