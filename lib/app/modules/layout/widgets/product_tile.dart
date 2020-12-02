import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // leading: , //TODO: Implement image system
        title: Text(product.title),
        subtitle: Text("Desct"), // TODO: Implement desc on productModel
        trailing: Text(product.value.toString()),
      ),
    );
  }
}
