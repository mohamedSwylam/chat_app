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

class AddPostScreen extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit, ChatAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Add new  post',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if(State is CreatePostLoadingState)
                  LinearProgressIndicator(),
                  if(State is CreatePostLoadingState)
                    SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${ChatAppCubit.get(context).userModel.profileImage}'),
                        radius: 35,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Hi,',
                                    style: TextStyle(
                                        fontFamily: 'Pacifico-Regular',
                                        letterSpacing: 1.5,
                                        fontSize: 15),
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    '${ChatAppCubit.get(context).userModel.name}',
                                    style: TextStyle(
                                        fontFamily: 'Pacifico-Regular',
                                        letterSpacing: 1.5,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'What\'s on your mind ?',
                                style: TextStyle(
                                    fontFamily: 'Pacifico-Regular',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 320,
                    height: 80,
                    child: TextFormField(
                      onTap: () {},
                      keyboardType: TextInputType.text,
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Write something...',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Pacifico-Regular',
                            height: 1,
                            letterSpacing: 1.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                  if(ChatAppCubit.get(context).postImage != null)
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:  FileImage(ChatAppCubit.get(context).postImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      ChatAppCubit.get(context).removePostImage();
                                    },
                                    icon: Icon(
                                      Icons.close,
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
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              ChatAppCubit.get(context).getPostImage();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Image),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Photo',
                                  style: TextStyle(
                                      fontFamily: 'Pacifico-Regular',fontSize: 18),
                                ),
                              ],
                            ),
                            height: 50,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                '# Tages',
                                style:
                                    TextStyle(fontFamily: 'Pacifico-Regular',fontSize: 18),
                              ),
                            ),
                            height: 50,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        var now = DateTime.now();
                        if(ChatAppCubit.get(context).postImage==null){
                          ChatAppCubit.get(context).createPost(dateTime: now.toString(), text: textController.text);
                          navigateAndFinish(context, HomeScreen());
                        }else{
                          ChatAppCubit.get(context).uploadPostImage(dateTime: now.toString(), text: textController.text);
                          navigateAndFinish(context, HomeScreen());
                        }
                      },
                      child: Center(
                        child: Text(
                          'Post',
                          style:
                          TextStyle(fontFamily: 'Pacifico-Regular',fontSize: 18),
                        ),
                      ),
                      height: 50,
                      textColor: Colors.white,
                    ),
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
