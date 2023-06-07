import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konash_app/core/app_strings.dart';
import 'package:konash_app/features/major/presentation/major_screen.dart';

import '../../choice_locale/choice_locale_screen.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = AppStrings.splash_screen;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
   Timer(Duration(seconds: 2) ,
         () => Navigator.pushReplacementNamed(context, ChoiceLocaleScreen.routeName),);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer() ,
              Image(image: AssetImage ("assets/images/logo.png")) ,
              Spacer() ,
              Text ("Powered by S_Team") ,
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}