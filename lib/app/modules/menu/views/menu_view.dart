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
                    maskedValue: controller.maskValue,
                  ),
                )
                .toList(),
          ),
        ),
      );
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final Function maskedValue;
  final Function onTap;

  const ProductCard({Key key, this.product, this.onTap, this.maskedValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: (product.imgUrl != null)
              ? Image.network(
                  product.imgUrl,
                  width: 60,
                  fit: BoxFit.fitHeight,
                )
              /*
AspectRatio(
          aspectRatio: 487 / 451,
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.topCenter,
                image: new NetworkImage('https://i.stack.imgur.com/lkd0a.png'),

                */
              : Image.asset('assets/images/not-found.jpg'),
          title: Text(product.title),
          trailing: Text(maskedValue(product.value)),
          subtitle: Text(product.description),
          onTap: () => onTap(product),
        ),
      );
}
