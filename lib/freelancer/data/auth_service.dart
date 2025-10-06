import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
 static late  SharedPreferences prefs;
 static const String userCredentialsKey = 'userCredentials';
  void initAuthService()async{
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> login(String email)async{
    prefs.setString(userCredentialsKey, email);
  }

  signup(String email)async{
    prefs.setString(userCredentialsKey, email);
  }
}