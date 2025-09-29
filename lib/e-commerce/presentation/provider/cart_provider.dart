import 'package:flutter/foundation.dart';
import 'package:gsg_flutter/data/product_model.dart';

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
}
