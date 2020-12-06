import 'package:delivery_store/app/modules/products/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProductView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  