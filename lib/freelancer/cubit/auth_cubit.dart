import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(AuthInitialState());

  login(String email, String password)async{

    emit(AuthLoadingState());
    // call api or firebase
    await Future.delayed(Duration(seconds: 2));
    if(password.contains('@')){
      emit(AuthErrorState('wrong email or password'));
      return;
    }

    emit(AuthSuccessState(email));
  }

  signup(String email, String password)async{

    emit(AuthLoadingState());
    // call api or firebase
    await Future.delayed(Duration(seconds: 2));
    if(password.contains('@')){
      emit(AuthErrorState('Password should not contain @'));
      return;
    }

    emit(AuthSuccessState(email));
  }
}