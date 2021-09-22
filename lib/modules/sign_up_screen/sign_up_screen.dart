import 'package:chatapp/layout/home_screen.dart';
import 'package:chatapp/modules/Login_screen/login_screen.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/cubit.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/states.dart';
import 'package:chatapp/modules/info_screen/info_screen.dart';
import 'package:chatapp/shared/components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, LoginScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 60, left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'SignUp',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 70,
                                    color: Colors.greenAccent),
                              ),
                            ],
                          ),
                        ],
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
                        prefix: Icons.email_outlined,
                        labelText: 'E-mail address',
                        type: TextInputType.emailAddress,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'e-mail address must not be empty';
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
                        controller: passwordController,
                        prefix: Icons.lock,
                        isPassword: SignUpCubit.get(context).isPasswordShown,
                        labelText: 'Password',
                        type: TextInputType.visiblePassword,
                        labelColor: Colors.grey,
                        onTap: () {},
                        suffix: SignUpCubit.get(context).suffix,
                        suffixPressed: () {
                          SignUpCubit.get(context).changePasswordVisibility();
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
                      height: 30,
                    ),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! SignUpLoadingState,
                        builder: (context) {
                          return defaultButton(
                              function: () {
                             if(formKey.currentState.validate()){
                                SignUpCubit.get(context).userSignUp(
                                    name: nameController.text,
                                    password: passwordController.text,
                                    phone:  phoneController.text,
                                    email: emailController.text);
                              }
                              },
                              text: 'SignUp',
                              color: Colors.greenAccent);
                        },
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I already have an account ',
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(context, LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        ),
                      ],
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
