import 'package:delivery_store/app/modules/menu/modules/edit_product/controllers/edit_product_controller.dart';
import 'package:get/get.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(
      () => EditProductController(),
    );
  }
}
