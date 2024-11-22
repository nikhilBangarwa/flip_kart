import 'dart:convert';
import 'package:call_save_data/core/end_point_screen.dart';
import 'package:call_save_data/core/service/shared_prefence.dart';
import 'package:call_save_data/product/model/product_model_screen.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService{
  Future <List<Product>>fetchProduct()async{
    String url=AppEndPoint.product;
    final response=  await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if(response.statusCode==200){
      final mapList=jsonDecode(response.body);
      List<Product> productList=[];
      for(int i=0;i < mapList.length;i++){
        final json=mapList[i];
        Product product=Product.fromJson(json);
        productList.add(product);

      }
      return productList;
    }
    else{
      throw 'Your data is not found';
    }

  }


  Future<bool> addProduct(Product product) async {
    String? token= await AuthStoreData.fetchData();
    if(token==null){
      throw 'Token is null';
    }
    String url = AppEndPoint.product;
    String jsonProduct = jsonEncode(product.toJson());
    final response =
    await http.post(Uri.parse(url), body: jsonProduct, headers: {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      throw 'Note Fount=>${response.statusCode}';
    }
  }
}