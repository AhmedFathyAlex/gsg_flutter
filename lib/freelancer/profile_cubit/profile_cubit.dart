import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/data/firestore_service.dart';
import 'package:gsg_flutter/freelancer/data/profile_user_model.dart';
import 'package:gsg_flutter/freelancer/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  fetchUserData()async{
    emit(ProfileLoadingState());
    try{
     var userModel = await FirestoreService.fetchUserData(FirebaseAuth.instance.currentUser!.uid);
      emit(ProfileSuccessState(userModel));
    }catch(e){
      //emit error state
      emit(ProfileErrorState(e.toString()));
    }
}

  updateProfile(ProfileUserModel model){
    emit(ProfileLoadingState());
    FirestoreService.updateUserData(model, FirebaseAuth.instance.currentUser!.uid)
    .then((value) {
      emit(ProfileSuccessState(model));
    }).catchError((error){
      emit(ProfileErrorState(error.toString()));
    });
  }
}