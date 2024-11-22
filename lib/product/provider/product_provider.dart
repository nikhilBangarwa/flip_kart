import 'package:call_save_data/core/app_util.dart';
import 'package:call_save_data/product/model/product_model_screen.dart';
import 'package:call_save_data/product/service/product_service.dart';
import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier{
  ProductService productService;
  ProductProvider(this.productService);
  List<Product> productList=[];
  String ?error;
  bool addSuccess=false;
  Future fetchData()async{
 try{
   productList = await productService.fetchProduct();
   notifyListeners();
 }catch(e){
 print("object");
   notifyListeners();
 }
  }
  Future addProduct(Product product) async {
    try {
      addSuccess = await productService.addProduct(product);
      if (addSuccess) {
        notifyListeners();
        AppUtil.showToast('Product Add SuccessFull');
      }
    } catch (e) {
      notifyListeners();
      AppUtil.showToast(e.toString());
    }
  }
}


