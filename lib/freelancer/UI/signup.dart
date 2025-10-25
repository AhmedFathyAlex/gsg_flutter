import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_cubit.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';
import 'package:gsg_flutter/freelancer/data/firebase_auth_service.dart';
import 'package:gsg_flutter/freelancer/data/firestore_service.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/freelancer/UI/home.dart';
import 'package:gsg_flutter/freelancer/UI/login.dart';
import 'package:gsg_flutter/widgets/custom_text_field.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          saveUserData(state.user.uid);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Home(name: state.user.email ?? '');
              },
            ),
          );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: Duration(milliseconds: 500),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Signup')),
        body: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    'https://plus.unsplash.com/premium_photo-1681487814165-018814e29155?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bG9naW58ZW58MHx8MHx8fDA%3D',
                    height: 200,
                  ),
                  CustomTextField(
                    hint: 'Name',
                    cont: nameController,
                    validate: (name) {
                      return name!.length >= 3 ? null : 'Enter Valid Name';
                    },
                  ),
                  CustomTextField(
                    hint: 'Email',
                    cont: emailCont,
                    validate: (email) {
                      if (!email!.contains('@')) return 'Email must contain @';
                      if (!email.contains('.')) return 'Email must contain .';
                      return null;
                    },
                  ),
                  CustomTextField(
                    hint: 'password',
                    isPassword: true,
                    cont: passwordController,
                    validate: (password) {
                      if (password!.length >= 8) return null;
                      return 'Weak Password';
                    },
                  ),
                  CustomTextField(
                    hint: 'confirm password',
                    isPassword: true,
                    cont: confirmPasswordController,
                    validate: (confirmPassword) {
                      if (confirmPassword == passwordController.text &&
                          confirmPassword!.isNotEmpty)
                        return null;
                      return 'Password must match';
                    },
                  ),
                  CustomTextField(
                    hint: 'phone number',
                    isPassword: true,
                    cont: phoneController,
                    validate: (phone) {
                      if (phone!.startsWith('01')) return null;
                      return 'Enter Valid Phone Number';
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    child: Text('Already have an account?'),
                  ),
                  ElevatedButton(
                    onPressed: () => _signup(context),
                    child: BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        return  state is AuthLoadingState ? 
                          CircularProgressIndicator() :
                          Text('signup');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // form validation
  _signup(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().signup(emailCont.text, passwordController.text);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter Valid Credentials'),
          duration: Duration(milliseconds: 500),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void saveUserData(String userId) {
    Map<String,dynamic> userData = {
      'name':nameController.text,
      'email':emailCont.text,
      'phone':phoneController.text,
    };
    FirestoreService.saveUserData(userData, userId);
  }
}
