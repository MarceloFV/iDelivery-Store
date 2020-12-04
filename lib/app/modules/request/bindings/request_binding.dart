import 'package:get/get.dart';
import 'package:delivery_store/app/modules/request/controllers/request_controller.dart';

class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestController>(
      () => RequestController(),
    );
  }
}
