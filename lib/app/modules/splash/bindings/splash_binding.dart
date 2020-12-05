import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(
        userRepository: UserRepository(
          provider: UserProvider(
            auth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          ),
        ),
        storeRepository: StoreRepository(
          provider: StoreProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
