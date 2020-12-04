import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/create_store/controllers/create_store_controller.dart';

class CreateStoreView extends GetView<CreateStoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar loja'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.titleController,
              decoration: InputDecoration(hintText: "Titulo"),
            ),
            TextFormField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "Telefone"),
            ),
            TextFormField(
              controller: controller.shipController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Valor frete"),
            ),
            TextButton(
              onPressed: controller.onCreateStoreBtnPressed,
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
