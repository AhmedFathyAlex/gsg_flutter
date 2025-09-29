import 'package:flutter/material.dart';
import 'package:gsg_flutter/e-commerce/data/product_model.dart';
import 'package:gsg_flutter/e-commerce/presentation/provider/cart_provider.dart';
import 'package:gsg_flutter/e-commerce/presentation/screens/product_details.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.model, this.isUsedInCart = false});
  final ProductModel model;
  final isUsedInCart ;
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context,);
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(model: model)),
        );
      },
      leading: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(model.image)),
        ),
      ),
      title: Text(model.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${model.price.toString()} \$',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(model.rating.toString()),
              const Icon(Icons.star, color: Colors.amberAccent),
              Text('(${model.ratingCount.toString()})'),
            ],
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          if(cartProvider.isInCart(model)) {
            cartProvider.removeFromCart(model);
          }else{
          cartProvider.addToCart(model);
          }
          
        },
        icon: cartProvider.isInCart(model) ?
        
         isUsedInCart ? Icon(Icons.delete) :  Icon(Icons.check)
         
          : Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
