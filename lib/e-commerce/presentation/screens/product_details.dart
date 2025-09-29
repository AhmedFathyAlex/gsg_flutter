import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/product_model.dart';
import 'package:gsg_flutter/widgets/rating.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(model.image),
            SizedBox(height: 3),
            Text(model.title),
            SizedBox(height: 3),
            Text(
              model.description,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Rating(rate: model.rating),
          ],
        ),
      ),
    );
  }
}
