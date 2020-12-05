import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:delivery_store/app/modules/products/controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: controller.onAddProductPressed,
        child: Text("Adicionar produto"),
      ),
    );
  }
}
  