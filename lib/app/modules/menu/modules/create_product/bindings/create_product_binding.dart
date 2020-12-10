import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/product_provider.dart';
import 'package:delivery_store/app/data/repository/product_repository.dart';
import 'package:delivery_store/app/modules/menu/modules/create_product/controllers/create_product_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class CreateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProductController>(
      () => CreateProductController(
        productRepository: ProductRepository(
          provider: ProductProvider(
            storage: FirebaseStorage.instance,
            firestore: FirebaseFirestore.instance,
          ),
        ),
        
      ),
    );
  }
}
