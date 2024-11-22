import 'dart:convert';
import 'package:call_save_data/auth/model/auth_model.dart';
import 'package:call_save_data/core/end_point_screen.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthService{
  Future <String>loginData(User user)async{
    String url=AppEndPoint.login;
    String strUser=jsonEncode(user.fromJson());
    Response response=  await http.post(Uri.parse(url),body:strUser,headers: {
      'Content-Type':'application/json'
    });
    if(response.statusCode==200){
      String str=response.body;
      final json=jsonDecode(str);
      final token=json['token'];
      return token;
    }else{
      throw 'Unable to Create user';
    }

  }

  Future<bool> sighUp(User user)async{
    String url=AppEndPoint.register;
    String string=jsonEncode(user.fromJson());
    Response response= await http.post(Uri.parse(url),body: string,headers: {
      'Content-Type':'application/json'});
    if(response.statusCode==201){
      return true;
    }
    else{
      throw  'Unable to create user';
    }
  }
}