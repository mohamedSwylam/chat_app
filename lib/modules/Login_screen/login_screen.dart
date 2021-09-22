import 'package:chatapp/layout/home_screen.dart';
import 'package:chatapp/modules/Login_screen/cubit/cubit.dart';
import 'package:chatapp/modules/Login_screen/cubit/states.dart';
import 'package:chatapp/modules/sign_up_screen/sign_up_screen.dart';
import 'package:chatapp/network/local/cache_helper.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginErrorState){
            showToast(text: state.error, state: ToastStates.ERROR);
          }
          if(state is LoginSuccessState){
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {navigateAndFinish(context, HomeScreen());});
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
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 80,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'There',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
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
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: defaultFormField(
                        controller: passwordController,
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPasswordShown,
                        suffixPressed: () => LoginCubit.get(context).changePasswordVisibility(),
                        prefix: Icons.lock,
                        labelText: 'Password',
                        type: TextInputType.visiblePassword,
                        labelColor: Colors.grey,
                        onTap: () {},
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'password must not be Short';
                          }
                          return null;
                        },
                        iconColor: Colors.grey,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 190),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) {
                          return defaultButton(
                              function: () {
                              if(formKey.currentState.validate()){
                                LoginCubit.get(context).userLogin(
                                    password: passwordController.text,
                                    email: emailController.text);
                              }
                              },
                              text: 'LOGIN',
                              color: Colors.greenAccent);
                        },
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultButton(
                        function: () {},
                text: 'Facebook',
                color: Colors.blue),
                        SizedBox(width: 10,),
                        defaultButton(
                            function: () {},
                            text: 'google',
                            color: Colors.red),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'have an account ? ',
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(context, SignUpScreen());
                          },
                          child: Text(
                            'SIGN UP',
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
      ),
    );
  }
}
