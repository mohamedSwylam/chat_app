import 'package:chatapp/modules/Login_screen/login_screen.dart';
import 'package:chatapp/modules/sign_up_screen/sign_up_screen.dart';
import 'package:chatapp/shared/components.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset('assets/images/welcome_image.png'),
            Spacer(
              flex: 3,
            ),
            defaultButton(function: () {
              navigateAndFinish(context, LoginScreen());
            }, text: 'LOGIN',color: Colors.greenAccent),
            SizedBox(height: 10,),
            defaultButton(function: () {
              navigateAndFinish(context, SignUpScreen());
            }, text: 'SIGN UP',color: Colors.orange),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
