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
  TextEditingController _descriptionController;
  TextEditingController _valueController;
  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get valueController => _valueController;

  //TODO: Receber o argumento da pagina com o valor da referencia de store...

  @override
  void onInit() {
    _storeModel.value =
        Get.arguments['store']; //TODO: Ajustar envio de parametros
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
      description: descriptionController.text, 
      isAvailable: true,
      likes: 0,
    );
    await _addProduct(product);
    Get.back(result: product);
  }

  _addProduct(ProductModel product) async {
    await productRepository.add(store, product);

  }
}

List<ProductModel> mockedProductList = [
  ProductModel(
    title: 'X-Bacon',
    isAvailable: true,
    value: 20.0,
    likes: 0,
    description: 'X-Bacon com ovos',
  ),
  ProductModel(
    title: 'Pizza',
    isAvailable: true,
    value: 22.0,
    likes: 0,
    description: 'Pizza com ovos',
  ),
  ProductModel(
    title: 'Coca lata',
    isAvailable: true,
    value: 5.0,
    likes: 0,
    description: 'coca latinha',
  ),
  ProductModel(
    title: 'X-EGG',
    isAvailable: true,
    value: 12.0,
    likes: 0,
    description: 'X-EGG com tomate',
  ),
  ProductModel(
    title: 'Pastel',
    isAvailable: true,
    value: 10.0,
    likes: 0,
    description: 'Pastel de queijo',
  ),
  ProductModel(
    title: 'Torta',
    isAvailable: true,
    value: 16.0,
    likes: 0,
    description: 'Torta de frango',
  ),
  ProductModel(
    title: 'Coxinha',
    isAvailable: true,
    value: 6.0,
    likes: 0,
    description: 'Coxinha de presunto',
  ),
  ProductModel(
    title: 'Empada',
    isAvailable: true,
    value: 6.0,
    likes: 0,
    description: 'Empada de bacalhau',
  ),
];
