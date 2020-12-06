import 'package:delivery_store/app/modules/menu/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(controller.product.title),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.edit), onPressed: controller.onEditPressed),
          ]),
      body: Center(
        child: Text(
          'ProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
