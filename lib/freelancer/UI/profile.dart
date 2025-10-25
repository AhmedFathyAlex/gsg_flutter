import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_cubit.dart';
import 'package:gsg_flutter/freelancer/cubit/auth_states.dart';
import 'package:gsg_flutter/freelancer/data/profile_user_model.dart';
import 'package:gsg_flutter/freelancer/profile_cubit/profile_cubit.dart';
import 'package:gsg_flutter/freelancer/profile_cubit/profile_states.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imageController = TextEditingController();

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
                          state.userProfile.image ??
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
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText:
                                '${state.userProfile.phone ?? 'No phone'}',
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
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText:
                                '${state.userProfile.email ?? 'No Email'}',
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
                          controller: imageController,
                          decoration: InputDecoration(
                            hintText:
                                '${state.userProfile.image ?? 'No Image'}',
                          ),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          var userProfileModel = ProfileUserModel(
                            name:
                                nameController.text.isNotEmpty
                                    ? nameController.text
                                    : state.userProfile.name,
                            phone:
                                phoneController.text.isNotEmpty
                                    ? phoneController.text
                                    : state.userProfile.phone,
                            email:
                                emailController.text.isNotEmpty
                                    ? emailController.text
                                    : state.userProfile.email,
                            image:
                                imageController.text.isNotEmpty
                                    ? imageController.text
                                    : state.userProfile.image,
                          );

                          context.read<ProfileCubit>().updateProfile(
                            userProfileModel,
                          );
                        },
                        child: Text('Update'),
                      ),
                    ],
                  )
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
