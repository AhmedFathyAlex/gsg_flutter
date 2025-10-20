import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/bloc_observer.dart';
import 'package:gsg_flutter/firebase_options.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_cubit.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/freelancer/UI/freelancer_details.dart';
import 'package:gsg_flutter/freelancer/UI/home.dart';
import 'package:gsg_flutter/freelancer/UI/login.dart';
import 'package:gsg_flutter/e-commerce/presentation/screens/main_nav_screen.dart';
import 'package:gsg_flutter/todo/data/notes_shared_db.dart';
import 'package:gsg_flutter/todo/data/notes_sqlite_db.dart';
import 'package:gsg_flutter/freelancer/UI/signup.dart';


void main()async{
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 await NotesSharedDb.init();
 await NotesSqliteDb.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.login: (context) => Login(),
          Routes.home: (context) => Home(),
          Routes.signup: (context) => Signup(),
          Routes.allProducts: (context) => MainNavScreen(),
          Routes.freelancerDetails: (context) => FreelancerDetails(),
        },
        home: Login(),
      ),
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
// Database Relational (SQL) vs NoSQL
