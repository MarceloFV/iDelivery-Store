import 'package:get/get.dart';
import 'package:delivery_store/app/modules/create_store/controllers/create_store_controller.dart';

class CreateStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateStoreController>(
      () => CreateStoreController(),
    );
  }
}
