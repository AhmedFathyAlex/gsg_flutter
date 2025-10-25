import 'package:gsg_flutter/freelancer/data/profile_user_model.dart';

abstract class ProfileStates {}
class ProfileInitialState extends ProfileStates {}
class ProfileLoadingState extends ProfileStates {}
class ProfileSuccessState extends ProfileStates {
  ProfileUserModel userProfile; 
  ProfileSuccessState(this.userProfile);
}
class ProfileErrorState extends ProfileStates {
  String error;
  ProfileErrorState(this.error);
}