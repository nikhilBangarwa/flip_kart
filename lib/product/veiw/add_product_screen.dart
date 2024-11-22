import 'package:call_save_data/product/model/product_model_screen.dart';
import 'package:call_save_data/product/provider/product_provider.dart';
import 'package:call_save_data/product/veiw/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController =TextEditingController();
  final disController =TextEditingController();
  final priceController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
           const SizedBox(height: 15,),
            TextField(
              controller: disController,
              decoration: InputDecoration(
                  labelText: 'dis',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            const SizedBox(height: 15,) ,
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                  labelText: 'price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed:addProductButton , child: Text('Login'))
          ],
        ),
      ),
    );
  }
  void addProductButton() async {
    String name = nameController.text;
    String des= disController.text;
    int price = int.parse(priceController.text);

    ProductProvider provider =
    Provider.of<ProductProvider>(context, listen: false);
    Product product = Product(
      name: name,
      description: des,
      price: price,

    );
    await provider.addProduct(product);
    if(mounted) {
      Navigator.pop(context);
    }
  }

}
