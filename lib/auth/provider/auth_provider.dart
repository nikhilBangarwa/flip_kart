import 'package:call_save_data/auth/model/auth_model.dart';
import 'package:call_save_data/auth/service/auth_service.dart';
import 'package:call_save_data/core/app_util.dart';
import 'package:call_save_data/core/service/shared_prefence.dart';
import 'package:flutter/material.dart';




class AuthProvider extends ChangeNotifier{
  AuthProvider(this.authService);
  AuthService authService;
  bool  isAuthenticated=false;
  bool isLogin=false;

  Future login(User user)async{
    try{
      isLogin=true;
      notifyListeners();
      String token=await authService.loginData(user);
      await AuthStoreData.saveData(token);
      if(token.isNotEmpty) {
        AppUtil.showToast('Your login Account');
        isAuthenticated=true;
        notifyListeners();
      }else{
        isAuthenticated=false;
        notifyListeners();
      }

    }catch(e){
       isLogin=false;
      AppUtil.showToast(e.toString());
      notifyListeners();

    }
    return 'Some thing wrong';
  }

  Future sighUp(User user)async{
    try{
      bool success=await authService.sighUp(user);
      isAuthenticated=success;
      notifyListeners();
      if(success){
        AppUtil.showToast('Your account is create');
      }

    }catch(e){
      isAuthenticated=false;
      notifyListeners();
      print('Object');

    }

  }
}