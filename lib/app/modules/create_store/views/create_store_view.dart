import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:delivery_store/app/modules/create_store/controllers/create_store_controller.dart';

class CreateStoreView extends GetView<CreateStoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateStoreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateStoreView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  