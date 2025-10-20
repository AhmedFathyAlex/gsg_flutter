import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_cubit.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: BlocBuilder<AuthCubit, AuthStates>(
          builder: (context, state) {
            return state is AuthSuccessState
                ? Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        '${state.user.photoURL ?? 'https://www.gravatar.com/avatar/placeholder'}',
                      ),
                      radius: 60,
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: '${state.user.displayName ?? 'No Name'}',
                        ),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    ElevatedButton(onPressed: (){
                      context.read<AuthCubit>().updateUserName(nameController.text);
                    }, child: Text('Update'))
                  ],
                )
                : Text('User not authenticated');
          },
        ),
      ),
    );
  }
}
