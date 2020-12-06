import 'package:delivery_store/app/data/model/product_model.dart';
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
      body: Obx(() => ListView(
            children: controller
                .productList
                .map<ProductCard>((product) => ProductCard(
                      product: product,
                    ))
                .toList(),
          )),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(product.title);
    return Card(
      child: ListTile(
        title: Text(product.title),
      ),
    );
  }
}
