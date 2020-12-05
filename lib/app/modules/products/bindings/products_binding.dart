import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/product_provider.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/products/controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(
        repository: ProductRepository(
          provider: ProductProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
