import 'package:call_save_data/category/model/category_model.dart';
import 'package:call_save_data/category/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final titleController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Category screen",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Add'
            ),
          ),
          ElevatedButton(onPressed: fetchCategory, child: Text('Add'))
        ],
      ),
    );
  }
  void fetchCategory()async{
    String title=titleController.text;
    final categoryProvider=Provider.of<CategoryProvider>(context,listen: false);
    Category category=Category(name: title);
     await categoryProvider.fetchCategory(category);
     Navigator.pop(context);

  }


}
