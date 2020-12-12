import 'dart:io';

import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductController extends GetxController {
  final ProductRepository productRepository;
  // final StoreRepository storeRepository;
  CreateProductController({@required this.productRepository});

  StoreModel store;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get valueController => _valueController;

  final haveImage = false.obs;
  
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    //TODO: Resolver bug de troca de imagem(nao troca)
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
      haveImage.value = true;
    } else {
      //TODO: Implement no image selected
    }
  }

  @override
  void onInit() {
    store = Get.arguments['store'];
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
    await productRepository.add(store, product, image);
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
