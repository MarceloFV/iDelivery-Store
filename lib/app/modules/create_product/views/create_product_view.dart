import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/create_product/controllers/create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar novo produto'),
        centerTitle: true,
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: controller.onAddProductPressed,
        child: Text("Adicionar produto"),
      ),
      body: ListView(
        children: [
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(hintText: 'Nome'),
          ),
          // TODO: Adicionar mascara de texto
          TextFormField(
            controller: controller.valueController,
            decoration: InputDecoration(hintText: 'Valor'),
            keyboardType: TextInputType.number,
            onFieldSubmitted: (str) => controller.onAddProductPressed(),
          ),
        ],
      ),
    );
  }
}
