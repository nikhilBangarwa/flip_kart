import 'package:call_save_data/category/model/category_model.dart';
import 'package:call_save_data/category/provider/category_provider.dart';
import 'package:call_save_data/category/veiw/add_category_screen.dart';
import 'package:call_save_data/category/veiw/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  void fetchCategory()async{
    CategoryProvider categoryProvider=Provider.of<CategoryProvider>(context,listen: false);
    await categoryProvider.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        await Navigator.push(context, MaterialPageRoute(builder: (context){
          return const AddCategoryScreen();
        }));
        fetchCategory();
      },child: const Icon(Icons.add),),
      appBar: AppBar(title: const Text("Category Screen",),),
      body: Consumer<CategoryProvider>(
          builder: (context,provider,child){
            return ListView.builder(
                itemCount: provider.categoryList.length,
                itemBuilder: (context,index){
                  final category=provider.categoryList[index];
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CategoryDetailsScreen(category: category,);
                        }));
                      },
                      title: Text(category.name??""),

                      trailing: IconButton(
                        onPressed: () {
                          CategoryProvider categoryProvider = Provider.of(context, listen: false);
                          categoryProvider.deleteProduct(category);


                        },
                        icon: const Icon(Icons.delete),
                      ),

                    ),
                  );

                });
          }),
    );
  }



}