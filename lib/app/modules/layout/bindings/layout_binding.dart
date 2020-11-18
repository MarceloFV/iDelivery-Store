import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/firebase_provider.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:get/get.dart';

import 'package:delivery_store/app/modules/layout/controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(
        productRepository: ProductRepository(
          provider: FirebaseProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
