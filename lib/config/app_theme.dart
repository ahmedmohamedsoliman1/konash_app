import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: Colors.white ,
    textTheme: TextTheme(
      bodyLarge: TextStyle (
        color: Colors.white ,
        fontSize: 18 ,
        fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
          color: Colors.white ,
          fontSize: 18 ,
          fontWeight: FontWeight.bold
      )
    )
  );
}