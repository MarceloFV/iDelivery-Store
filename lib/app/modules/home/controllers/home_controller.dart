import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var user;

  @override
  void onInit() {
    user = Get.arguments['user'];
    print(user);
    super.onInit();
  }
}
