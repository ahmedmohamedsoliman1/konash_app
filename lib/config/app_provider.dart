import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier {

  String appLan = "en" ;

  void changeLang (String newLan){

      if (appLan == newLan){
        return ;
      }else {
        appLan = newLan ;
      }

      notifyListeners();
    }
}