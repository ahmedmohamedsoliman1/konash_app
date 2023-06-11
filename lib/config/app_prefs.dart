import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {

  static late SharedPreferences prefs;

  static Future initPrefs ()async{
    prefs = await SharedPreferences.getInstance();
  }

 /// saveCardData
  static Future <bool> saveNameCard (String name) async{
    return await prefs.setString("name", name);
  }

  static Future <bool> saveDescriptionCard (String description) async {
   return await prefs.setString("description", description);
  }

 static  Future <bool> saveAddressCard (String address) async{
    return await prefs.setString("address", address);
 }

  static  Future <bool> saveCityCard (String city) async{
    return await prefs.setString("city", city);
  }

  /// getCardData


   static String? getNameCard (String key){
   return prefs.getString("name");

   }

   static String? getDescriptionCard (){
    return prefs.getString("description");
   }

  static String? getAddressCard (){
    return prefs.getString("address");
  }

  static String? getCityCard (){
    return prefs.getString("city");
  }

}