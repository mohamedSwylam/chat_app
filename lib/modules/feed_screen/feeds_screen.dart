import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/models/post_model.dart';
import 'package:chatapp/modules/add_new_post/add_new_post.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedsScreen extends StatelessWidget {
  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit,ChatAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: ConditionalBuilder(
            condition: ChatAppCubit.get(context).posts.length > 0 && ChatAppCubit.get(context).userModel !=null,
            builder: (context){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            backgroundImage: NetworkImage(
                                '${ChatAppCubit.get(context).userModel.profileImage}'),
                            radius: 25,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            width: 270,
                            height: 45,
                            child: TextFormField(
                              onTap: () {
                                navigateTo(context, AddPostScreen());
                              },
                              keyboardType: TextInputType.text,
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: 'What\'s on your mind ?',
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Pacifico-Regular',
                                    height: 1,
                                    letterSpacing: 1.5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusColor: Colors.grey,
                                fillColor: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50.0,
                                    ),
                                    Icon(
                                      IconBroken.Image,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Photo',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Pacifico-Regular'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(width: 1,color: Colors.grey,height: 30,),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60.0,
                                  ),
                                  Text('#', style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'Pacifico-Regular',),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Tags', style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Pacifico-Regular'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      myDivider(),
                      SizedBox(
                        height: 5,
                      ),
                      ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildFeedsItem(ChatAppCubit.get(context).posts[index],context,index);
                          },
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: myDivider(),
                          ),
                          itemCount: ChatAppCubit.get(context).posts.length),
                    ],
                  ),
                ),
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget buildFeedsItem(PostModel model,context,index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    backgroundImage: NetworkImage(
                        '${model.profileImage}'),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico-Regular',
                                height: 1.5,
                                letterSpacing: 1.5,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: kPrimaryColor,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        '${model.dateTime}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: 'Pacifico-Regular'),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      IconBroken.More_Circle,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                  '${model.text}'),
            ),
            if(model.postImage !='')
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${model.postImage}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            '${ChatAppCubit.get(context).likes[index]}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Pacifico-Regular'),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 12,
                            ),
                            radius: 10,
                            backgroundColor: kPrimaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            '120 comments',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Pacifico-Regular'),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.comment,
                            color: kPrimaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    backgroundImage: NetworkImage(
                        '${ChatAppCubit.get(context).userModel.profileImage}'),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: 215,
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'write a comment ...',
                        suffixIcon: Icon(IconBroken.Camera),
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Pacifico-Regular',
                            height: 1,
                            letterSpacing: 1.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusColor: Colors.grey,
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  InkWell(
                    onTap: (){
                      ChatAppCubit.get(context).likePost(ChatAppCubit.get(context).postsId[index]);
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 12,
                      ),
                      radius: 20,
                      backgroundColor: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
