import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
 static putPool(key,value){
    sharedPreferences?.setBool(key, value);
  }
  static getkey(key)
  {
   return sharedPreferences?.get(key)??false;
}
}
