import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final ProductRepository repository;
  ProductsController({@required this.repository});

  final _products = <ProductModel>[].obs;

  List<ProductModel> get productList => _products;

  @override
  void onInit() {
    _fetchProducts();
    super.onInit();
  }

  _fetchProducts() async {
    _products.assignAll(await repository.getProducts());
  }

  void onAddProductPressed() {
    Get.toNamed(Routes.PRODUCTS+Routes.CREATE_PRODUCT);
  }
}
