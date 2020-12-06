import 'package:delivery_store/app/modules/products/modules/create_product/controllers/create_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: SafeArea(
        minimum: EdgeInsets.all(16),
              child: ListView(
          children: [
            TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(hintText: 'Nome'),
            ),
            TextFormField(
              controller: controller.descriptionController,
              decoration: InputDecoration(hintText: 'Descrição'),
            ),
            // TODO: Adicionar mascara de texto
            TextFormField(
              controller: controller.valueController,
              decoration: InputDecoration(hintText: 'Valor'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
