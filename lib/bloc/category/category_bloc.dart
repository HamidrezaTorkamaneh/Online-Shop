import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/category/category_event.dart';
import 'package:online_shop/bloc/category/category_state.dart';

import '../../data/repository/category_repository.dart';
import '../../di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  final ICategoryRepository  _repository=locator.get();
  CategoryBloc():super(CategoryInitialState()){
    on<CategoryRequestList>((event, emit)async {
      emit(CategoryLoadingState());
      var response=await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }


}