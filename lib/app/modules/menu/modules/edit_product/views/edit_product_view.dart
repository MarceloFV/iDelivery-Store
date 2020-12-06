import 'package:delivery_store/app/modules/menu/modules/edit_product/controllers/edit_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuModulesEditProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MenuModulesEditProductView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  