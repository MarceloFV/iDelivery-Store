import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/provider/request_provider.dart';
import 'package:delivery_store/app/data/repository/request_repository.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/request/controllers/request_controller.dart';

class RequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestController>(
      () => RequestController(
        repository: RequestRepository(
          provider: RequestProvider(
            firestore: FirebaseFirestore.instance,
          ),
        ),
      ),
    );
  }
}
