import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        repository: UserRepository(
          provider: UserProvider(
            auth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
