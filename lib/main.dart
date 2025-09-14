import 'package:flutter/material.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/screens/freelancer_details.dart';
import 'package:gsg_flutter/screens/home.dart';
import 'package:gsg_flutter/screens/login.dart';
import 'package:gsg_flutter/screens/main_nav_screen.dart';
import 'package:gsg_flutter/screens/notes.dart';
import 'package:gsg_flutter/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
   String? email = prefs.getString(Login.userCredentialsKey);
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.login: (context) => Login(),
        Routes.home: (context) => Home(),
        Routes.signup: (context) => Signup(),
        Routes.allProducts: (context) => MainNavScreen(),
        Routes.freelancerDetails: (context) => FreelancerDetails(),
      },
      home: email != null ? NotesScreen() : Login(),
    ),
  );
}

// Built-in widgets
// MatrialApp - Scaffold - Center - Text
// AppBar - Icon - Column - Row - Container
// Images (Network - Assets)

//https://www.linkedin.com /in/ahmedfathyalex/edit/forms/certification/new/  ?profileFormEntryPoint=PROFILE_COMPLETION_HUB
// https://www.news.com/news/sports?type=football
// Endpoint [baseurl / path ? queries]
// simple Local Data persistence (shared prefs) 
// Database
