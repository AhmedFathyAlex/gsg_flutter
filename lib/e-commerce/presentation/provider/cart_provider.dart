import 'package:flutter/foundation.dart';
import 'package:gsg_flutter/e-commerce/data/product_model.dart';
import 'package:gsg_flutter/e-commerce/data/product_repository.dart';

class CartProvider extends ChangeNotifier{
  List<ProductModel> cart = [];
  List<ProductModel> products = [];

  void addToCart(ProductModel product){
    cart.add(product);
    notifyListeners();
  }
  void removeFromCart(ProductModel product){
    cart.remove(product);
    notifyListeners();
  }

  fetchData()async{
    var fetchedProducts= await ProductRepository.fetchDataFromServer();
    products = fetchedProducts;
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
