import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/modules/menu/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
          centerTitle: true,
        ),
        bottomNavigationBar: RaisedButton(
          onPressed: controller.onAddProductPressed,
          child: Text("Adicionar produto"),
        ),
        body: Obx(
          () => ListView(
            children: controller.productList
                .map<ProductCard>(
                  (product) => ProductCard(
                    product: product,
                    onTap: controller.onProductCardPressed,
                  ),
                )
                .toList(),
          ),
        ),
      );
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final Function onTap;

  const ProductCard({Key key, this.product, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(product.title),
          trailing: Text(product.value.toString()),
          subtitle: Text(product.description),
          onTap: () => onTap(product),
        ),
      );
}
