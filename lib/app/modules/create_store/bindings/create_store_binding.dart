import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/create_store/controllers/create_store_controller.dart';

class CreateStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateStoreController>(
      () => CreateStoreController(
        storeRepository: StoreRepository(
          provider: StoreProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
        userRepository: UserRepository(
          provider: UserProvider(
            auth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
