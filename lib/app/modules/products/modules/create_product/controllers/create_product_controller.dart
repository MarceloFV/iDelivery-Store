import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductController extends GetxController {
  final ProductRepository productRepository;
  final StoreRepository storeRepository;
  CreateProductController(
      {@required this.productRepository, @required this.storeRepository});

  final _storeModel = StoreModel().obs;
  StoreModel get store => _storeModel.value;

  TextEditingController _nameController;
  TextEditingController _valueController;
  TextEditingController get nameController => _nameController;
  TextEditingController get valueController => _valueController;

  //TODO: Receber o argumento da pagina com o valor da referencia de store...

  @override
  void onInit() {
    _storeModel.value = Get.arguments['store']; //TODO: Ajustar envio de parametros
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
    );
    await _addProduct(product);
    Get.back(result: product);
  }

  _addProduct(ProductModel product) async {
    await productRepository.add(store, product);
    // _storeModel.value.menu.add(productReference);
    // await storeRepository.addProductReferenceToMenu(store, productReference);
  }
}
