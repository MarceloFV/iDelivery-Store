import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  ProductModel product;

  @override
  void onInit() {
    product = Get.arguments['product'];
    super.onInit();
  }

  onEditPressed() {
    //TODO: Implement onEditPressed
    print('onEditPressed');
  }
}
