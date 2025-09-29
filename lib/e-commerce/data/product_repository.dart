import 'dart:convert';
import 'dart:developer';

import 'package:gsg_flutter/e-commerce/data/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {

  static Future<List<ProductModel>> fetchDataFromServer() async {
    var response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    log(response.body); // json(string)
    var data = jsonDecode(response.body); // decoding
    List<ProductModel> products = [];
    // [{}] -> [ model ]
    for (Map map in data) {
      ProductModel model = ProductModel.fromJson(map);
        products.add(model);
    }
    return products;
  }
}