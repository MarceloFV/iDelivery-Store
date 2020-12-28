import 'package:delivery_store/app/data/model/request.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/repository/request_repository.dart';

class RequestController extends GetxController {
  final RequestRepository repository;

  RequestController({@required this.repository});

  // List<RequestModel> requestList;
  Rx<List<RequestModel>> requestList = Rx<List<RequestModel>>();
  // List<RequestModel> get requests => requestList.value;

  @override
  void onInit() {
    StoreModel store = Get.arguments['store'];
    // repository.getStream(store);
    requestList.bindStream(repository.getStream(store));
    // print(requestList.value.first);
    // requestList.bindStream(repository.getStream(store));

    super.onInit();
  }
}
