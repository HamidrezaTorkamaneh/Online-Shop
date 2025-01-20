import 'package:dartz/dartz.dart';
import '../../data/model/banner.dart';

abstract class HomeState {}

class HomeInitState extends HomeState{

}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampaign>> bannerList;
  HomeRequestSuccessState(this.bannerList);
}
