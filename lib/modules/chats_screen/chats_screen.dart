import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/models/post_model.dart';
import 'package:chatapp/models/user_model.dart';
import 'package:chatapp/modules/add_new_post/add_new_post.dart';
import 'package:chatapp/modules/chat_details/chat_details.dart';
import 'package:chatapp/shared/components.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {
  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatAppCubit,ChatAppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: ConditionalBuilder(
            condition: ChatAppCubit.get(context).users.length > 0 ,
            builder: (context){
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                  child: Column(
                    children: [
                      ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return buildChatItem(ChatAppCubit.get(context).users[index],context);
                          },
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(height: 1,),
                          ),
                          itemCount: ChatAppCubit.get(context).users.length ),
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

  Widget buildChatItem(UserModel model,context) => InkWell(
    onTap: (){
      navigateTo(context, ChatDetails(userModel: model,));
    },
    child: Padding(
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
                  width: 30,
                ),
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
                      width: 10,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: kPrimaryColor,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
