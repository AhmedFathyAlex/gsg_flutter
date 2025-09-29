import 'package:flutter/material.dart';
import 'package:gsg_flutter/e-commerce/presentation/provider/cart_provider.dart';
import 'package:gsg_flutter/e-commerce/presentation/widgets/product_widget.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart'), backgroundColor: Colors.amber),
      body: Center(
        child:
            cartProvider.cart.isEmpty
                ? Text('No Items in Cart')
                : ListView.builder(
                  itemCount: cartProvider.cart.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(model: cartProvider.cart[index],
                    isUsedInCart: true,);
                  },
                ),
      ),
    );
  }
}
