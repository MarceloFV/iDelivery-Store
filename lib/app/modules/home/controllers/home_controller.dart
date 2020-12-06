import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  UserModel user;
  StoreModel store;
  final isOpen = false.obs;

  @override
  void onInit() {
    user = Get.arguments['user'];
    store = Get.arguments['store'];
    print(user);
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
    print('Abrindo loja');
    //TODO: Implement openStore method
    Get.toNamed(Routes.REQUEST, arguments: {'store': store});
  }

  _closeStore() {
    //TODO: Implement closeStore method
    print('Fechando loja');
  }

  onDrawerMenuPressed() {
    print('store from home: $store');
    Get.toNamed(Routes.MENU, arguments: {'store': store});
  }
}
