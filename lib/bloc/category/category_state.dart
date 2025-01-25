import 'package:dartz/dartz.dart';

import '../../data/model/category.dart';


abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Category>> response;

  CategoryResponseState(this.response);
}
