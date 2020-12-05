import 'package:get/get.dart';
import 'package:delivery_store/app/modules/products/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(),
    );
  }
}
