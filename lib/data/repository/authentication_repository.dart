import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasource/authentication_datasource.dart';
import 'package:online_shop/di/di.dart';
import 'package:online_shop/util/api_exception.dart';

abstract class IAuthRepository{
  Future<Either<String,String>> register(String username,String password,String passwordConfirm);
}

class AuthenticationRepository  extends IAuthRepository {
  final IAuthenticationDatasource _datasource= locator.get();

  @override
  Future<Either<String, String>> register(String username, String password, String passwordConfirm) async{
    try{
      await _datasource.register('hamid80', 'hamid1234', 'hamid1234');
      return right('ثبت نام انجام شد');
    }on ApiException catch(ex){
      return left(ex.message??'خطا محتوا متنی ندارد');
    }
  }



}