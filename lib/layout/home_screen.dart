import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/shared/styles/icon_broken.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <ChatAppCubit,ChatAppStates>(
          listener: (context,state){},
          builder: (context,state){
            return DefaultTabController(
              length: ChatAppCubit.get(context).screens.length,
              child: Scaffold(
                appBar: AppBar(
                    title: Text('ChatApp',style: TextStyle(fontFamily: 'Pacifico-Regular',letterSpacing: 2.5,fontWeight: FontWeight.bold),),
                elevation: 0.0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(IconBroken.Search,size: 20,),
                    ),
                  ],
                ) ,
                body: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 50,
                    bottom: TabBar(
                      physics: BouncingScrollPhysics(),
                      indicatorColor: Colors.white,
                      isScrollable: false,
                      tabs: ChatAppCubit.get(context).tabBarItem,
                      onTap: (index) => ChatAppCubit.get(context).changeTabBarItem(index),

                    ),
                  ),
                  body: ChatAppCubit.get(context).screens[ChatAppCubit.get(context).currentTabIndex],
                ),
              ),
            );
          },
    );
  }
}
