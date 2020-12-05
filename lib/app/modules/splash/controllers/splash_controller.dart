import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  final UserRepository userRepository;
  final StoreRepository storeRepository;
  SplashController(
      {@required this.userRepository, @required this.storeRepository});

  Worker worker;

  final user = UserModel().obs;
  StoreModel store;

  @override
  void onInit() {
    worker = ever(user, onUserChanged);
    fetchUser();
    super.onInit();
  }

  @override
  void onClose() {
    worker.dispose();
  }

  fetchUser() async {
    user.value = await userRepository.getCurrentUser();
  }

  fetchStore() async {
    store = await storeRepository.getStore(user.value);
  }

  onUserChanged(UserModel u) async {
    await fetchStore();
    if (u != null) {
      if (u.store != null) {
        Get.offAllNamed(Routes.HOME, arguments: {'user': u, 'store': store});
      } else {
        Get.offAllNamed(Routes.CREATE_STORE, arguments: {
          'user': u
        }); //TODO: Vai dar erro quando eu ir para a store;
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
