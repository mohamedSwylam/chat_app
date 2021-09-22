import 'package:chatapp/modules/welcome_screen/start_screen.dart';
import 'package:chatapp/modules/welcome_screen/welcome_screen.dart';
import 'package:chatapp/network/local/cache_helper.dart';
import 'package:chatapp/shared/components.dart';
import 'package:flutter/material.dart';
const kDefaultPadding = 20.0;
const kPrimaryColor=Color(0xFF00BF6D);
const kSecondryColor=Color(0xFFFE9901);
const kContentColorDarkTheme=Color(0xFFF5FCF9);
const kContentColorLightTheme=Color(0xFF1D1D35);
const kWarrningColor = Color(0xFFF3BB1C);
const kErrorColor=Color(0xFFF03738);
//const kPrimaryColor=Color(0xFF00BF6D);
String uId='';

void signOut(context)=> CacheHelper.removeData(key: 'uId').then((value) {
  if(value){
    navigateAndFinish(context, StartScreen());
  }
});