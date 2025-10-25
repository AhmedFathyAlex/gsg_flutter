import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_cubit.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';
import 'package:gsg_flutter/freelancer/profile_cubit/profile_cubit.dart';
import 'package:gsg_flutter/freelancer/profile_cubit/profile_states.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchUserData(),
      child: Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: Center(
          child: BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              return state is ProfileSuccessState
                  ? Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://www.gravatar.com/avatar/placeholder',
                        ),
                        radius: 60,
                      ),

                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: '${state.userProfile.name ?? 'No Name'}',
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: '${state.userProfile.phone ?? 'No phone'}',
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: '${state.userProfile.email ?? 'No Email'}',
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().updateUserName(
                            nameController.text,
                          );
                        },
                        child: Text('Update'),
                      ),
                    ],
                  )
                  : Text('User not authenticated');
            },
          ),
        ),
      ),
    );
  }
}
