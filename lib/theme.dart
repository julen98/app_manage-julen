import 'package:flutter/material.dart';

const Color PrimaryColor = Color(0xff007aff);

const MaterialColor PrimaryMaterialColor = MaterialColor(
  0xff007aff,
  <int, Color>{
      50:  Color(0xff006ee6), //10% 
      100: Color(0xff0062cc), //20% 
      200: Color(0xff0055b3), //30% 
      300: Color(0xff004999), //40% 
      400: Color(0xff003d80), //50% 
      500: Color(0xff003166), //60% 
      600: Color(0xff00254d), //70% 
      700: Color(0xff001833), //80% 
      800: Color(0xff000c19), //90% 
      900: Color(0xff000000), //100% 
    },
);

ThemeData myTheme = ThemeData(
  fontFamily: "customFont",
  primaryColor: Color(0xff15049b),
  primarySwatch: PrimaryMaterialColor,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontFamily: "customFont",
      fontWeight: FontWeight.w600,
    ),
  ),
);
