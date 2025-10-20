import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates {}
class AuthInitialState extends AuthStates {}
class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final UserCredential user;
  AuthSuccessState(this.user);
}

class AuthErrorState extends AuthStates {
  final String errorMessage;
  AuthErrorState(this.errorMessage);
}
