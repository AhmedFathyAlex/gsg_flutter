import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_cubit.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';
import 'package:gsg_flutter/routes.dart';
import 'package:gsg_flutter/freelancer/home.dart';

import 'package:gsg_flutter/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({super.key});

  

  final TextEditingController emailCont = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Home(name: state.email);
            },
          ));
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              duration: Duration(milliseconds: 300),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                  'https://plus.unsplash.com/premium_photo-1681487814165-018814e29155?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bG9naW58ZW58MHx8MHx8fDA%3D',
                  height: 200,
                ),
                CustomTextField(
                  hint: 'Email',
                  cont: emailCont,
                  validate: (email) {
                    if (email!.contains('@') && email.contains('.'))
                      return null;
                    return 'Enter Valid Email';
                  },
                ),
                CustomTextField(
                  validate: (password) {
                    if (password!.length >= 8) return null;
                    return 'Weak Password';
                  },
                  hint: 'password',
                  isPassword: true,
                  cont: passwordController,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signup);
                  },
                  child: Text('didnt have an account?'),
                ),
                BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () => _login(context),
                      child: state is AuthLoadingState
                          ? CircularProgressIndicator()
                          : Text('login'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String email = emailCont.text;
      String password = passwordController.text;

      // call cubit to login
      BlocProvider.of<AuthCubit>(context).login(email, password);
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

}
