import 'package:call_save_data/product/model/product_model_screen.dart';
import 'package:flutter/material.dart';


class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ProductDetails Screen',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(product.name ?? ""),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.description ?? ""),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Iv",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.blue,
                            )),
                        TextSpan(text: product.iV.toString())
                      ])),
                ],
              ),
              trailing: Text("₹${product.price}"),
            ),
          )
        ],
      ),
    );
  }
}

