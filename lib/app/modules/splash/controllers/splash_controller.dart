import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;
  SplashController(
      {@required this.authRepository, @required this.storeRepository});

  final store = StoreModel().obs;

  @override
  void onInit() {
    ever(store, onStoreChanged);
    fetchStore();
    super.onInit();
  }

  fetchStore() async {
    String uid = authRepository.getCurrentUID();
    if (uid == null) return store.value = null;
    store.value = await storeRepository.getStore(uid);
  }

  onStoreChanged(StoreModel s) async {
    await Future.delayed(Duration(seconds: 0));
    if (s != null)
      return Get.offAllNamed(Routes.HOME, arguments: {'store': s});
    else
      return Get.offAllNamed(Routes.LOGIN);
  }
}
