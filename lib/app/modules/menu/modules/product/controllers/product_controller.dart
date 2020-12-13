import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductModel product;

  var controller = new MoneyMaskedTextController(leftSymbol: 'R\$ ');
  String get productValue {
    controller.updateValue(product.value);
    return controller.text;
  }

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
