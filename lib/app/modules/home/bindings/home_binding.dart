import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      ()=>HomeController(
        userRepository: UserRepository(provider: UserProvider(auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance))
      ),
    );
  }
}
