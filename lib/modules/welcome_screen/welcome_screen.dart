import 'package:chatapp/modules/welcome_screen/start_screen.dart';
import 'package:chatapp/shared/components.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class WelcomeScreen extends StatelessWidget {
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
            Text(
              ' Welcome To our Messaging App',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              'join us now to communicate and chatting with your best friends ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.64),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            FittedBox(
              child: TextButton(
                onPressed: () {
                  navigateAndFinish(context, StartScreen());
                },
                child: Row(
                  children: [
                    Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(0.8)),
                    ),
                    SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
