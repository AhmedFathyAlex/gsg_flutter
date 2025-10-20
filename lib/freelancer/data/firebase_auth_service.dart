import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // login 
  static Future<UserCredential?> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
   var credentials =  await auth.signInWithEmailAndPassword(email: email, password: password);
    return credentials;
  }

  // signup

  static Future<UserCredential?> signup(String email , String password) async{
    FirebaseAuth auth = FirebaseAuth.instance;
   var credentials =  await auth.createUserWithEmailAndPassword(email: email, password: password);
    return credentials;
  }

  static Future<void> logout() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}