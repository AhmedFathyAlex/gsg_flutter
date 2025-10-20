import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';
import 'package:gsg_flutter/freelancer/data/firebase_auth_service.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  checkIfLoggedIn(){
    if (FirebaseAuth.instance.currentUser != null){
      emit(AuthSuccessState(FirebaseAuth.instance.currentUser!));
    }
  }

  login(String email, String password) async {
    emit(AuthLoadingState());
    // call api or firebase
    try {
      var credentials = await FirebaseAuthService.login(email, password);
      emit(AuthSuccessState(credentials!.user!));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      return;
    }

  }

  signup(String email, String password) async {
    emit(AuthLoadingState());
    // call api or firebase
    try {
      var credentials = await FirebaseAuthService.signup(email, password);
      emit(AuthSuccessState(credentials!.user!));
    } catch (e) {
      emit(AuthErrorState(e.toString()));
      return;
    }
  }

  updateUserName(String name)async{
    emit(AuthLoadingState());
   await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    emit(AuthSuccessState(FirebaseAuth.instance.currentUser!));
  }

  
}
