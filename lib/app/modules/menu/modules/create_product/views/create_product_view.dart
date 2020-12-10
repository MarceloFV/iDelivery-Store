import 'package:delivery_store/app/modules/menu/modules/create_product/controllers/create_product_controller.dart';
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
            Obx(
              () => controller.haveImage.value
                  ? Image.file(
                      controller.image,
                      height: 310,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            ListTile(
              title: Text('Adicionar imagem'),
              trailing: Icon(Icons.photo_library),
              onTap: controller.getImage,
            ),

            TextFormField(
              controller: controller.nameController,
              decoration: InputDecoration(hintText: 'Nome'),
            ),
            TextFormField(
              controller: controller.descriptionController,
              decoration: InputDecoration(hintText: 'Descrição'),
            ),
            // TODO: Add mask
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
