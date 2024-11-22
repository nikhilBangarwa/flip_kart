 import 'package:call_save_data/core/service/shared_prefence.dart';
import 'package:flutter/cupertino.dart';

class SplashProvider extends ChangeNotifier{

  Future<bool> checkInfo()async{
    bool loginIN=false;
    String ?token=await AuthStoreData.fetchData();
    if(token!=null){
      loginIN=true;
    }else{
      loginIN=false;
    }
   return loginIN;
  }
}