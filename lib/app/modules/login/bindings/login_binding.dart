import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/modules/login/controllers/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
          repository: UserRepository(
            provider: UserProvider(
              firestore: FirebaseFirestore.instance,
              auth: FirebaseAuth.instance,
            ),
          ),
          ),
    );
  }
}
