import 'package:call_save_data/product/provider/product_provider.dart';
import 'package:call_save_data/product/veiw/add_product_screen.dart';
import 'package:call_save_data/product/veiw/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    ProductProvider productProvider =
    Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
       await Navigator.push(context, MaterialPageRoute(builder: (context){
          return AddProductScreen();
        }));
       fetch();
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title: const Text(
          'Product Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: Consumer<ProductProvider>(builder: (context, provider, child) {
        return ListView.builder(
            itemCount: provider.productList.length,
            itemBuilder: (context, index) {
              final product = provider.productList[index];
              return Card(
                child: ListTile(
                  title: Text(product.name ?? ''),
                  subtitle: Text(product.description??''),
                  trailing: Text("\$${product.price}"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ProductDetailsScreen(product: product);
                    }));
                  },
                ),
              );
            });
      }),
    );
  }
}