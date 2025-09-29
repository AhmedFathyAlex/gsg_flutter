import 'package:flutter/foundation.dart';
import 'package:gsg_flutter/e-commerce/data/product_model.dart';

class CartProvider extends ChangeNotifier{
  List<ProductModel> cart = [];

  void addToCart(ProductModel product){
    cart.add(product);
    notifyListeners();
  }
  void removeFromCart(ProductModel product){
    cart.remove(product);
    notifyListeners();
  }

  void clearCart(){
    cart.clear();
    notifyListeners();
  }

  bool isInCart(ProductModel product){
    for (var element in cart)  {
      if(element.id == product.id){
        return true;
      }
    }
    return false;
  }
}
