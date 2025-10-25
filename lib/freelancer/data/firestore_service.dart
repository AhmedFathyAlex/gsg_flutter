import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsg_flutter/freelancer/data/profile_user_model.dart';

class FirestoreService {
static const String usersCollection = 'users';

 static saveUserData(Map<String,dynamic> userData, String userId)async{
    // Implementation to save user data to Firestore
    await FirebaseFirestore.instance.collection(usersCollection)
    .doc(userId).set(userData);
  }

  static Future<ProfileUserModel> fetchUserData(String userId)async{
    // Implementation to fetch user data from Firestore
    DocumentSnapshot doc = await FirebaseFirestore.
    instance.collection(usersCollection)
    .doc(userId).get();

    if (doc.exists){
      var data = doc.data() as Map<String, dynamic> ;
      var userModel = ProfileUserModel.fromJson(data);
      return userModel;
    }else{
      throw Exception("User data not found");
    }
  }
}
