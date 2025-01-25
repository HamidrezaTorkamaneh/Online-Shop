import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/home/home_event.dart';
import 'package:online_shop/bloc/home/home_state.dart';
import 'package:online_shop/data/repository/category_repository.dart';
import '../../data/repository/banner_repository.dart';
import '../../di/di.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitializeData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getBanners();
      var categoryList = await _categoryRepository.getCategories();

      emit(HomeRequestSuccessState(bannerList, categoryList));
    });
  }
}
