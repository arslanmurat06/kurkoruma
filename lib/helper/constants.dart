import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      headline4: TextStyle(color: Colors.black),
      headline6: TextStyle(color: Colors.orange),
      bodyText1: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.black);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    textTheme: TextTheme(
      headline4: TextStyle(color: Colors.white),
      headline6: TextStyle(color: Colors.lightBlue),
      bodyText1: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: Color(0xff39ACE7));
