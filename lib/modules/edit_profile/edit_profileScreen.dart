import 'dart:io';
import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/modules/sign_up_screen/cubit/cubit.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var userModel=ChatAppCubit.get(context).userModel;
          var profileImage=ChatAppCubit.get(context).profileImage;
          var coverImage=ChatAppCubit.get(context).coverImage;

          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: 'Edit profile',
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 210,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Container(
                                  height: 140,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: coverImage == null ? NetworkImage('${userModel.coverImage}',):FileImage(coverImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        ChatAppCubit.get(context).getCoverImage();
                                      },
                                      icon: Icon(
                                        IconBroken.Camera,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    backgroundColor: kPrimaryColor,
                                    radius: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 64,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundImage: profileImage == null ? NetworkImage('${userModel.profileImage}',):FileImage(profileImage),
                                  radius: 60,
                                  backgroundColor: kPrimaryColor,
                                ),
                              ),
                              CircleAvatar(
                                child: IconButton(
                                  onPressed: () {
                                    ChatAppCubit.get(context).getProfileImage();
                                  },
                                  icon: Icon(
                                    IconBroken.Camera,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                backgroundColor: kPrimaryColor,
                                radius: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
           /*        if(ChatAppCubit.get(context).coverImage !=null ||ChatAppCubit.get(context).profileImage != null )
                   Row(
                     children: [
                       if(ChatAppCubit.get(context).profileImage != null)
                       Expanded(
                           child: Column(
                             children: [
                               MaterialButton(
                                 onPressed: () {
                                   ChatAppCubit.get(context).uploadProfileImage(
                                   );
                                 },
                                 child: Text(
                                   'Upload Profile',
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontFamily: 'Pacifico-Regular',
                                       fontWeight: FontWeight.bold,
                                       height: 1.5,
                                       letterSpacing: 1,
                                       fontSize: 10),
                                 ),
                                 color:kPrimaryColor,

                               ),
                               if(state is UpdateLoadingState)
                               SizedBox(height: 5,),
                               if(state is UpdateLoadingState)
                               LinearProgressIndicator(),
                             ],
                           )),
                       SizedBox(
                         width: 10,
                       ),
                       if(ChatAppCubit.get(context).coverImage != null)
                       Expanded(
                           child: Column(
                             children: [
                               MaterialButton(
                                 onPressed: () {
                                   ChatAppCubit.get(context).uploadCoverImage();
                                 },
                                 child: Text(
                                   'Upload Cover',
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontFamily: 'Pacifico-Regular',
                                       fontWeight: FontWeight.bold,
                                       height: 1.5,
                                       letterSpacing: 1,
                                       fontSize: 10),
                                 ),
                                 color: kPrimaryColor,
                               ),
                               if(state is UpdateLoadingState)
                               SizedBox(height: 5,),
                               if(state is UpdateLoadingState)
                               LinearProgressIndicator(),
                             ],
                           )),
                     ],
                   ),
                    if(ChatAppCubit.get(context).coverImage !=null ||ChatAppCubit.get(context).profileImage != null )
                      SizedBox(
                      height: 20,
                    ),*/
                    defaultButton(
                      function: () =>
                        signOut(context),
                      text: 'Logout',
                      color: Colors.greenAccent,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                      function: () {

                      },
                      text: 'update',
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
