import 'package:bloc/bloc.dart';
import 'package:chatapp/layout/cubit/cubit.dart';
import 'package:chatapp/layout/cubit/states.dart';
import 'package:chatapp/layout/home_screen.dart';
import 'package:chatapp/modules/Login_screen/login_screen.dart';
import 'package:chatapp/shared/bloc_observer.dart';
import 'package:chatapp/shared/constants.dart';
import 'package:chatapp/shared/styles/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/sign_up_screen/cubit/cubit.dart';
import 'modules/welcome_screen/welcome_screen.dart';
import 'network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  Widget widget;
  if (uId != null) {
    widget = HomeScreen();
  } else {
    widget = WelcomeScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ChatAppCubit()..getUserData()..getPosts(),
        ),
      ],
      child: BlocConsumer<ChatAppCubit, ChatAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightThemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: ThemeMode.system,
            home: startWidget,
          );
        },
      ),
    );
  }
}
