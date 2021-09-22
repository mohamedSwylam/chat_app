import 'package:chatapp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData (BuildContext context){
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    //appBarTheme: AppBarTheme,
    iconTheme: IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondryColor,
      error: kErrorColor,
    ),
  );
}
ThemeData darkThemeData (BuildContext context){
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    //appBarTheme: AppBarTheme,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark(
      primary: kPrimaryColor,
      secondary: kSecondryColor,
      error: kErrorColor,
    ),
  );
}