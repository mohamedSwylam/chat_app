import 'dart:io';
import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/cubit.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ChatDetails extends StatelessWidget {
  UserModel userModel;
  ChatDetails({this.userModel});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(IconBroken.Arrow___Left_Square),
                onPressed: (){
                  Navigator.pop(context);
                },),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        '${userModel.profileImage}'),
                    radius: 22,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${userModel.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico-Regular',
                        height: 1.5,
                        letterSpacing: 1.5,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                Container(
                padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  color:  Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 32,
                      color: Color(0xFF087949).withOpacity(0.08),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.sentiment_satisfied_alt_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.64),
                              ),
                              SizedBox(width: kDefaultPadding / 2),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Type message",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Icon(
                                IconBroken.Camera,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.64),
                              ),
                              SizedBox(width: kDefaultPadding / 2),
                              Icon(
                                IconBroken.Send,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.64),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
