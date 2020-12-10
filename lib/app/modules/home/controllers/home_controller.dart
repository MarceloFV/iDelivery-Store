import 'package:get/get.dart';

import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final AuthRepository authRepository;

  HomeController({@required this.authRepository});

  StoreModel store;

  final isOpen = false.obs;

  @override
  void onInit() {
    store = Get.arguments['store'];
    super.onInit();
  }

  onOpenCloseStorePressed() {
    isOpen.toggle();
    if (isOpen.value)
      return _openStore();
    else
      return _closeStore();
  }

  _openStore() {
  }

  _closeStore() {
  }

  onDrawerMenuPressed() {
    Get.toNamed(Routes.MENU, arguments: {'store': store});
  }

  onLogoutPressed() {
    authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
