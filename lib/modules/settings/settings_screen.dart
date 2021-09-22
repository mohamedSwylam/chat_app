import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/modules/edit_info/edit_info.dart';
import 'package:chatapp/modules/edit_profile/edit_profileScreen.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel=ChatAppCubit.get(context).userModel;
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: 210,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${userModel.coverImage}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${userModel.profileImage}',),
                            radius: 60,
                            backgroundColor: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${userModel.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico-Regular',
                        height: 1.5,
                        letterSpacing: 1.5,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${userModel.bio}',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Pacifico-Regular',
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        letterSpacing: 1,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          'Add Photos',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pacifico-Regular',
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 1,
                              fontSize: 10),
                        ),
                        color: Colors.grey[300],
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: MaterialButton(
                        onPressed: () {
                          navigateTo(context, EditInfoScreen());
                        },
                        child: Text(
                          'Edit Info',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Pacifico-Regular',
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 1,
                              fontSize: 10),
                        ),
                        color: Colors.grey[300],
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          child: MaterialButton(
                        minWidth: 10,
                        onPressed: () {
                          navigateTo(context, EditProfile());
                        },
                        child: Icon(
                          IconBroken.Edit,
                          size: 16,
                        ),
                        color: Colors.grey[300],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '1.2k',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    fontSize: 15),
                              ),
                              Text(
                                'followers',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    letterSpacing: 1,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '92',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    fontSize: 15),
                              ),
                              Text(
                                'followings',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    letterSpacing: 1,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '155',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    fontSize: 15),
                              ),
                              Text(
                                'posts',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    letterSpacing: 1,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '3.6k',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    fontSize: 15),
                              ),
                              Text(
                                'likes',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Pacifico-Regular',
                                    letterSpacing: 1.5,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10, top: 20),
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${userModel.work} ',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                  height: 1.5,
                                  letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.school,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${userModel.education}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                  height: 1.5,
                                  letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${userModel.relationship}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                  height: 1.5,
                                  letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${userModel.phone}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                  height: 1.5,
                                  letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${userModel.address}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Pacifico-Regular',
                                  height: 1.5,
                                  letterSpacing: 1.5,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
