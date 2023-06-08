import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:konash_app/config/fireBase_fun.dart';
import 'package:konash_app/features/login/data/user_model.dart';

class UserProvider extends ChangeNotifier{

  User? user ;
  UserModel? userModel ;

  UserProvider (){

    user = FirebaseAuth.instance.currentUser ;
    initUser();
  }
    void initUser()async{
    if (user != null){
      var userId = FirebaseAuth.instance.currentUser!.uid;
      userModel = await FireBaseFun.getUserPhoneFromFireBase(userId);
    }
  }
}

