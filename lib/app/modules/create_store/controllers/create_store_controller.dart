import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateStoreController extends GetxController {
  final StoreRepository storeRepository;
  final UserRepository userRepository;

  CreateStoreController(
      {@required this.storeRepository, @required this.userRepository});

  var titleController = TextEditingController();
  var phoneController = TextEditingController();
  var shipController = TextEditingController();

  onCreateStorePressed() async {
    StoreModel storeModel = StoreModel(
      title: titleController.text,
      phoneNumber: phoneController.text,
      shipPrice: double.parse(shipController.text),
    );
    String uid = userRepository.getCurrentUserId();
    StoreModel store = await storeRepository.createStore(uid, storeModel);
    UserModel user = Get.arguments['user'];
    user = user.copyWith(store: store.reference);
    user = await userRepository.attachStoreToUser(user);
    if (user != null) if (user.store != null)
      Get.offAllNamed(Routes.HOME, arguments: {'store': store, 'user': user});
  }
}
