abstract class AuthStates {}
class AuthInitialState extends AuthStates {}
class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final String email;
  AuthSuccessState(this.email);
}

class AuthErrorState extends AuthStates {
  final String error;
  AuthErrorState(this.error);
}
