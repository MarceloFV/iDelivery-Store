import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/debug/controllers/debug_controller.dart';

class DebugBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DebugController>(DebugController(
        repository: StoreRepository(
          provider: StoreProvider(
            firestore: FirebaseFirestore.instance,
            storage: null,
          ),
        ),
      ),
    );
  }
}
