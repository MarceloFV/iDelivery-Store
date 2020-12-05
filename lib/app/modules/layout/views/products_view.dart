import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/modules/layout/controllers/layout_controller.dart';
import 'package:delivery_store/app/modules/layout/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsView extends GetView {
  final LayoutController controller = Get.find<LayoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: controller.onAddProductPressed,
        child: Text("Adicionar produto"),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              ProductModel product = controller.productList[index];
              return ProductTile(
                product: product,
              );
            },
          ),
        ),
      ),
    );
  }
}
