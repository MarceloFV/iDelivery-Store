import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final ProductRepository repository;
  ProductsController({@required this.repository});

  var store;

  final _products = <ProductModel>[].obs;

  List<ProductModel> get productList => _products;

  @override
  void onInit() {
    store = Get.arguments['store'];
    _fetchProducts();
    super.onInit();
  }

  _fetchProducts() async {
    print('_products : $_products'); //TODO: Decidir extrutura de dados
    // print('store : $store');
    // print('')
    _products.assignAll(await repository.getAll(store));
  }

  void onAddProductPressed() {
    Get.toNamed(Routes.PRODUCTS + Routes.CREATE_PRODUCT,
        arguments: {'store': store});
  }
}
