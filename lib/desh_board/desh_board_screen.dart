import 'package:call_save_data/cart/veiw/cart_screen.dart';
import 'package:call_save_data/category/veiw/category_screen.dart';
import 'package:call_save_data/product/veiw/product_screen.dart';
import 'package:call_save_data/profile/veiw/profile_screen.dart';
import 'package:flutter/material.dart';


class DeskBoardScreen extends StatefulWidget {
  const DeskBoardScreen({super.key});

  @override
  State<DeskBoardScreen> createState() => _DeskBoardScreenState();
}

class _DeskBoardScreenState extends State<DeskBoardScreen> {
  List<Widget> list=[
    const ProductScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: list,
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore),label: 'explore'),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'category'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'account'),
      ],
        currentIndex: index,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.red,
        type:BottomNavigationBarType.fixed,
        onTap: onchange,
      ),
    );
  }
  void onchange(int value){
    setState(() {
      index=value;
    });
  }
}



