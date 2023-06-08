import 'package:flutter/material.dart';

import '../core/app_colors.dart';

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
          fontSize: 16 ,
          fontWeight: FontWeight.bold
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor ,
      unselectedItemColor: Colors.black26
    )
  );
}