import 'package:flutter/foundation.dart';
import 'package:konash_app/features/choice_locale/choice_locale_navigator.dart';

class ChoiceLocaleViewModel extends ChangeNotifier {
  late ChoiceLocaleNavigator navigator ;

  String newLangFun (bool tab1 , bool tab2 , bool tab3){
    if (tab1){
      return "en" ;
    }else if (tab2){
      return "ar" ;
    }else if (tab3){
      return "fr" ;
    }else {
      return "en" ;
    }
  }
}