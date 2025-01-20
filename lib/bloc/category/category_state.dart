import 'package:dartz/dartz.dart';
import 'package:online_shop/data/model/my_category.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Category>> response;

  CategoryResponseState(this.response);
}
