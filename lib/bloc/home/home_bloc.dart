import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/home/home_event.dart';
import 'package:online_shop/bloc/home/home_state.dart';

import '../../data/repository/banner_repository.dart';
import '../../di/di.dart';


class HomeBloc extends Bloc<HomeEvent,HomeState>{
  final IBannerRepository _bannerReposiory=locator.get();
   HomeBloc():super(HomeInitState()){
     on<HomeGetInitializeData>((event, emit)async{
       emit(HomeLoadingState());
       var bannerList= await _bannerReposiory.getBanners();
       emit(HomeRequestSuccessState(bannerList));

     });
   }
}