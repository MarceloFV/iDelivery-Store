import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  final UserRepository repository;
  SplashController({@required this.repository});

  Worker worker;

  final user = UserModel().obs;

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
    user.value = await repository.getCurrentUser();
  }

  onUserChanged(UserModel u) {
    if (u != null) {
      if (u.store != null) {
        Get.offAllNamed(Routes.HOME, arguments: {'user': u});
      } else {
        Get.offAllNamed(Routes.CREATE_STORE, arguments: {'user': u});
      }
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
