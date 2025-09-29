import 'package:flutter/material.dart';
import 'package:gsg_flutter/e-commerce/presentation/provider/cart_provider.dart';
import 'package:gsg_flutter/e-commerce/presentation/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Colors.amber,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Badge.count(count: cartProvider.cart.length, child: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ProductWidget(model: cartProvider.products[index]);
          },
          itemCount: cartProvider.products.length,
        ),
      ),
    );
  }
}
