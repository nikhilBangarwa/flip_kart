import 'package:shared_preferences/shared_preferences.dart';

class AuthStoreData{
  static const String tokenKey='token';
  static Future saveData(String token)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setString( tokenKey, token);
  }
  static Future fetchData()async{
    SharedPreferences shared=await SharedPreferences.getInstance();
    String ?token= shared.getString(tokenKey);
    return token;
  }
}