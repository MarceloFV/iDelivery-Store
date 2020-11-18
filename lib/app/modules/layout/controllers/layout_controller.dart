import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  final ProductRepository productRepository;

  LayoutController({this.productRepository});

  StoreModel _store;
  UserModel _user;

  final _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;
  set currentIndex(int index) => _currentIndex.value = index;

  final _pageController = PageController().obs;
  get pageController => _pageController.value;

  final _productList = List<ProductModel>().obs;
  List<ProductModel> get productList => _productList;

  @override
  void onInit() {
    // _store = Get.arguments['store'];
    // _user = Get.arguments['user'];
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    _productList.value = await productRepository.getAll();
  }
//TODO: Vou deixar essa parte para o final para poder trabalahar com as duas aplicacoes ao mesmo tempo
  getRequests() async {
    final stream = await productRepository.getStream();
    stream.listen((event) {
      print(event);
    });
  }

  // @override
  // void onReady() {}

  // @override
  // void onClose() {}

  void onItemTapped(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex = index;
  }

  void onAddProductPressed() async {
    final newProduct = await Get.toNamed(
      Routes.CREATE_PRODUCT,
      // arguments: {'storeReference': _store.reference}, // TODO: Ajustar o envio de referencia
    );
    _productList.add(newProduct);
  }
}
