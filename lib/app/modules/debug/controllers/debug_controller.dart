import 'package:get/get.dart';
import 'package:meta/meta.dart';

import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';

class DebugController extends GetxController {
  final StoreRepository repository;

  DebugController({@required this.repository});
  @override
  void onInit() {
    init();
    super.onInit();
  }
  init() async{
    var store = await repository.read('sduhisaduhdsaiuhsd');
    Get.offAllNamed(Routes.HOME, arguments: {'store': store});
  }
}
