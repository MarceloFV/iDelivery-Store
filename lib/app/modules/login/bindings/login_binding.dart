import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:delivery_store/app/data/provider/auth_provider.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/modules/login/controllers/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: AuthRepository(
          provider: AuthProvider(
            auth: FirebaseAuth.instance,
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
