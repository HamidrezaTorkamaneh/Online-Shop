import 'package:dartz/dartz.dart';

import 'package:online_shop/data/datasource/banner_datasource.dart';
import 'package:online_shop/di/di.dart';
import '../../util/api_exception.dart';
import '../model/banner.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampaign>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<BannerCampaign>>> getBanners() async {
    try {
      var response = await _datasource.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوا متنی ندارد');
    }
  }
}
