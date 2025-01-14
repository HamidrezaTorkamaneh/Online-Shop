import 'package:bloc/bloc.dart';
import 'package:online_shop/bloc/authentication/auth_event.dart';
import 'package:online_shop/bloc/authentication/auth_state.dart';
import 'package:online_shop/di/di.dart';

import '../../data/repository/authentication_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final IAuthRepository _repository=locator.get();
  AuthBloc():super(AuthInitiateState()){
    on<AuthLoginRequest>((event, emit) async{
      emit(AuthLoadingState());
      var response= await _repository.login(event.username, event.password);
      emit(AuthResponseState(response));
    },);

  }
}