
import 'dart:convert';
import 'package:call_save_data/category/model/category_model.dart';
import 'package:call_save_data/core/end_point_screen.dart';
import 'package:call_save_data/core/service/shared_prefence.dart';
import 'package:http/http.dart' as http;

class CategoryService{
  Future<List<Category>>fetchCategory()async{
    String url=AppEndPoint.category;
    final response= await http.get(Uri.parse(url), headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if(response.statusCode==200){
      final mapList=jsonDecode(response.body);
      List<Category> categoryList=[];
      for(int i=0;i<mapList.length;i++){
        final json=mapList[i];
        Category category=Category.fromJson(json);
        categoryList.add(category);

      }
      return categoryList;
    }else{
      throw 'your data is Not found';
    }
  }

 Future<bool> addCategory(Category category)async{
    String ?token=await AuthStoreData.fetchData();
    if(token==null){
      throw 'token is null';
    }
    String url=AppEndPoint.category;
    String jsonToken=jsonEncode(category.toJson());
    final response= await http.post(Uri.parse(url),body: jsonToken,headers: {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    } );
    if(response.statusCode==201){
      return true;
    }else{
      throw 'Your not found add category';
    }

 }

  Future<bool> deleteCategory(Category category) async {

      String? token = await AuthStoreData.fetchData();
      if (token == null) {
        throw 'Authorization token is null';
      }
      String url = "${AppEndPoint.deleteProduct}/${category.sId}";
      final response = await http.delete(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
        'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy',
      });

      if (response.statusCode == 201) {
        return true;

    } else{
        throw 'Your product is Not delete';
      }
  }


}