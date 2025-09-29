import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/e-commerce/presentation/screens/all_products.dart';
import 'package:gsg_flutter/e-commerce/presentation/screens/cart.dart';

class MainNavScreen extends StatefulWidget {
  MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainAppState();
}

class _MainAppState extends State<MainNavScreen> {
  List<Widget> screens = [AllProducts(), Cart(), Text('Settings')];
  
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[index]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
