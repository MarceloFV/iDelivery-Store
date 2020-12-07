import 'package:delivery_store/app/modules/menu/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            controller.product.title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Get.back(),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: controller.onEditPressed,
              color: Colors.black,
            ),
          ]),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              ImageSection(imgUrl: controller.product.imgUrl),
              SizedBox(
                height: 25,
              ),
              TitleAndPriceSection(
                title: controller.product.title,
                value: controller.product.value,
              ),
              SizedBox(
                height: 16,
              ),
              DescriptionSection(
                description: controller.product.description,
              ),
              SizedBox(
                height: 17,
              ),
            ],
          )),
    );
  }
}

class ImageSection extends StatelessWidget {
  final String imgUrl;

  const ImageSection({Key key, this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        child: Image.network(
          imgUrl ??
              'https://st2.depositphotos.com/1692343/5636/i/950/depositphotos_56360353-stock-photo-hot-homemade-pepperoni-pizza.jpg', //TODO: Criar imagem padrao para ausencia de imagem
          height: 310.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class TitleAndPriceSection extends StatelessWidget {
  final String title;
  final double value;

  const TitleAndPriceSection({Key key, this.title, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(), //TODO: Mask value 
            style: TextStyle(
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  final String description;

  DescriptionSection({this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        description ?? "Nenhuma descrição fornecida",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
