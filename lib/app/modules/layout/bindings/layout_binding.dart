import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/request_provider.dart';
import 'package:delivery_store/app/data/repository/request_repository.dart';
import 'package:get/get.dart';

import 'package:delivery_store/app/modules/layout/controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(
      () => LayoutController(
        repository: RequestRepository(
          provider: RequestProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
