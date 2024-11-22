import 'package:call_save_data/category/model/category_model.dart';
import 'package:call_save_data/category/service/category_service.dart';
import 'package:call_save_data/core/app_util.dart';
import 'package:call_save_data/core/end_point_screen.dart';
import 'package:call_save_data/core/service/shared_prefence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CategoryProvider extends ChangeNotifier{
 CategoryProvider(this.categoryService);
 CategoryService categoryService;
 List<Category> categoryList=[];
 bool isSuccess=false;
 Future fetchData()async{
 try{
  categoryList= await categoryService.fetchCategory();
  notifyListeners();
 }catch(e){
  AppUtil.showToast(e.toString());
 }
 }

  Future fetchCategory(Category category)async{
   isSuccess= await categoryService.addCategory(category);
   if(isSuccess){
    AppUtil.showToast('Your category Added ');
    notifyListeners();
   }else{
    AppUtil.showToast('your product is Not added');
   }
  }

 Future deleteProduct(Category category) async {
  try {
   bool isDeleted = await categoryService.deleteCategory(category);
   if (isDeleted) {
    AppUtil.showToast('Your Product is delete');
    notifyListeners();

   }
  } catch (error) {
   AppUtil.showToast(error.toString());
  }
 }


}