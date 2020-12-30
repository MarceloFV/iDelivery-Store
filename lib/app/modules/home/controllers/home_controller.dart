import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:get/get.dart';

import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;

  HomeController({
    @required this.authRepository,
    @required this.storeRepository,
  });

  StoreModel store;

  final isOpen = false.obs;

  @override
  void onInit() {
    store = Get.arguments['store'];
    isOpen.value = store.isOpen;
    super.onInit();
  }

  @override
  void onClose() {
    print('porra, fecha ai');
    _closeStore();
    super.onClose();
  }

  onOpenCloseStorePressed() {
    isOpen.toggle();
    if (isOpen.value)
      return _openStore();
    else
      return _closeStore();
  }

  onOpenDashboardPressed() {
    Get.toNamed(Routes.REQUEST, arguments: {'store': store});
    //TODO: Implement onOpenDashboardPressed
  }

  onDrawerMenuPressed() {
    Get.toNamed(
      Routes.MENU,
      arguments: {
        'store': store,
      },
    );
  }

  _openStore() => storeRepository.open(store);

  _closeStore() => storeRepository.close(store);

  onLogoutPressed() {
    authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
