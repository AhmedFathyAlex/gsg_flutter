import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/data/firestore_service.dart';
import 'package:gsg_flutter/freelancer/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  fetchUserData()async{
    emit(ProfileLoadingState());
    await Future.delayed(Duration(seconds: 2));
    try{
     var userModel = await FirestoreService.fetchUserData(FirebaseAuth.instance.currentUser!.uid);
      emit(ProfileSuccessState(userModel));
    }catch(e){
      //emit error state
      emit(ProfileErrorState(e.toString()));
    }
}
}