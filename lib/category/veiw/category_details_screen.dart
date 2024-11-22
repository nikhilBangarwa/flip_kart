import 'package:call_save_data/category/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({super.key,required this.category});
  Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category Details'),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(category.name.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
            Text(category.hashCode.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13)),
            Text("<${category.sId.toString()}>",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19)),
          ],
        ),
      ),
    );
  }
}





