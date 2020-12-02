import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductController extends GetxController {
  final ProductRepository productRepository;
  CreateProductController({this.productRepository});

  DocumentReference _storeReference;

  TextEditingController _nameController;
  TextEditingController _valueController;
  TextEditingController get nameController => _nameController;
  TextEditingController get valueController => _valueController;

  //TODO: Receber o argumento da pagina com o valor da referencia de store...

  @override
  void onInit() {
    // _storeReference = Get.arguments['storeReference']; //TODO: Ajustar envio de parametros
    _nameController = TextEditingController();
    _valueController = TextEditingController();
    super.onInit();
  }

  void onAddProductPressed() async {
    ProductModel product = ProductModel(
      title: nameController.text,
      value: double.parse(
        valueController.text,
      ),
      storeReference: _storeReference,
    );
    //TODO: Criar funcao que adiciona o produto nos produtos
    //TODO: Criar funcao que adiciona o produto na lista de referencias da store
    await _addProduct(product);
    Get.back(result: product);
  }

  _addProduct(ProductModel product) => productRepository.add(product);
}
