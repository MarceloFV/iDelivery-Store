import 'package:delivery_store/app/data/model/request.dart';
import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/repository/request_repository.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  final RequestRepository repository;

  RequestController({this.repository});

  // List<RequestModel> requestList;
  // Rx<List<RequestModel>> requestList = Rx<List<RequestModel>>();
  // List<RequestModel> get requests => requestList.value;

  // @override
  // void onInit() {
  //   StoreModel store = Get.arguments['store'];
  //   requestList.bindStream(repository.getStream(store.reference.id));
  //   super.onInit();
  // }
}
