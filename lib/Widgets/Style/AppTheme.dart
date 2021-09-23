import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      appBarTheme: AppBarTheme().copyWith(backgroundColor: Colors.yellow),
      accentColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      buttonColor: Colors.yellow,
      //
      //
      textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Emporia",
              letterSpacing: 1),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Sailor",
              letterSpacing: 1),
          headline3: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.8,
              height: 1.8,
              fontFamily: "Helvetica"),
          headline4:
              TextStyle(fontFamily: "Blanco", fontWeight: FontWeight.bold),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              letterSpacing: 1.8),
          headline6: TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: "Sebino",
            // height: 1.8,
            // letterSpacing: 1.8,
          )));

  static final ThemeData dark = ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff1D212B),
      accentColor: Colors.yellow,
      scaffoldBackgroundColor: Color(0xff1D212B),
      iconTheme: IconThemeData(color: Colors.black),
      buttonColor: Colors.yellow,
      //
      //
      textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Emporia",
              letterSpacing: 1),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: "Sailor",
              letterSpacing: 1),
          headline3: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.8,
              height: 1.8,
              fontFamily: "Helvetica"),
          headline4:
              TextStyle(fontFamily: "Blanco", fontWeight: FontWeight.bold),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Playfair",
              letterSpacing: 1.8),
          headline6: TextStyle(
            // fontWeight: FontWeight.bold,
            fontFamily: "Sebino",
            // height: 1.8,
            // letterSpacing: 1.8,
          )));
}
