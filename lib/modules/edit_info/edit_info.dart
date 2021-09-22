import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/layout/home_screen.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/states.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInfoScreen extends StatelessWidget {
  var addressController = TextEditingController();
  var educationController = TextEditingController();
  var workController = TextEditingController();
  var bioController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var relationshipController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppStates>(
      listener: (context, state) {
        if(state is UpdateSuccessState){
          navigateAndFinish(context, HomeScreen());
        }
      },
      builder: (context, state) {
        var userModel=ChatAppCubit.get(context).userModel;
         addressController.text = userModel.address;
         educationController.text = userModel.education;
         workController.text= userModel.work;
         bioController.text = userModel.bio;
         dateOfBirthController.text = userModel.dateOfBirth;
         relationshipController.text = userModel.relationship;
         nameController.text = userModel.name;
         phoneController.text = userModel.phone;
         emailController.text = userModel.email;
         passwordController.text = userModel.password;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Info',
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(state is UpdateLoadingState)
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'account info',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico-Regular',
                          height: 1.5,
                          letterSpacing: 1.5,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: nameController,
                      prefix: Icons.person,
                      labelText: 'Nick Name',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your name ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: emailController,
                      prefix: Icons.email,
                      labelText: 'Email address',
                      type: TextInputType.emailAddress,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your email ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: passwordController,
                      prefix: Icons.lock,
                      isPassword: ChatAppCubit.get(context).isPasswordShown,
                      labelText: 'Password',
                      type: TextInputType.visiblePassword,
                      labelColor: Colors.grey,
                      onTap: () {},
                      suffix: ChatAppCubit.get(context).suffix,
                      suffixPressed: () {
                        ChatAppCubit.get(context).changePasswordVisibility();
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'password must not be Short';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: defaultButton(
                      function: () {
                        ChatAppCubit.get(context).updateUser(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text,
                          education: educationController.text,
                          work: workController.text,
                          address: addressController.text,
                          relationship: relationshipController.text,
                          dateOfBirth: dateOfBirthController.text,
                        );
                      },
                      text: 'update',
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'personal info',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico-Regular',
                          height: 1.5,
                          letterSpacing: 1.5,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: phoneController,
                      prefix: Icons.call,
                      labelText: 'Phone Number',
                      type: TextInputType.phone,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Phone must not be empty';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: relationshipController,
                      prefix: Icons.favorite,
                      labelText: 'RelationShip',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your Relationship ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: dateOfBirthController,
                      prefix: Icons.date_range,
                      labelText: 'Date of birth',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your date of birth ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: defaultButton(
                      function: () {
                        ChatAppCubit.get(context).updateUser(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text,
                          education: educationController.text,
                          work: workController.text,
                          address: addressController.text,
                          relationship: relationshipController.text,
                          dateOfBirth: dateOfBirthController.text,
                        );
                      },
                      text: 'update',
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'general info',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico-Regular',
                          height: 1.5,
                          letterSpacing: 1.5,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: bioController,
                      prefix: Icons.info_outline,
                      labelText: 'Bio',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Write your bio ...';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: educationController,
                      prefix: Icons.school,
                      labelText: 'Education',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your education ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: workController,
                      prefix: Icons.work,
                      labelText: 'Work',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your work ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: defaultFormField(
                      controller: addressController,
                      prefix: Icons.home,
                      labelText: 'address',
                      type: TextInputType.text,
                      labelColor: Colors.grey,
                      onTap: () {},
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your address ..';
                        }
                        return null;
                      },
                      iconColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: defaultButton(
                      function: () {
                        ChatAppCubit.get(context).updateUser(
                          name: nameController.text,
                          phone: phoneController.text,
                          bio: bioController.text,
                          education: educationController.text,
                          work: workController.text,
                          address: addressController.text,
                          relationship: relationshipController.text,
                          dateOfBirth: dateOfBirthController.text,
                        );
                      },
                      text: 'update',
                      color: Colors.greenAccent,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
