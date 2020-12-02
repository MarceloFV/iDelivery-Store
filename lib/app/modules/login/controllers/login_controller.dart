import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  final UserRepository repository;

  LoginController({@required this.repository}) : assert(repository != null);

  UserModel userModel;

  final email = "".obs;
  final password = "".obs;
  final emailError = RxString();
  final passwordError = RxString();

  onEmailChanged(String changedEmail) {
    if (!GetUtils.isEmail(changedEmail)) {
      emailError.value = "Email inválido";
      return;
    }
    emailError.value = null;
    email.value = changedEmail;
  }

  onPasswordChanged(String changedPassword) {
    if (changedPassword.length < 6) {
      passwordError.value = "Senha inválida";
      return;
    }
    passwordError.value = null;
    password.value = changedPassword;
  }

  login() async {
    print('login');
    // try {
    //   // final login = await repository.login(email.value, password.value);
    //   // userModel = await repository.getUser(repository.getUserId());
    //   if (login != null && userModel != null)
    //     Get.offAndToNamed(Routes.HOME, arguments: {'user': userModel});
    // } catch (e) {
    //   if (Get.isSnackbarOpen) Get.back();
    //   Get.snackbar("Usuário inválido", "Email ou senha incorretos",
    //       colorText: Colors.white,
    //       backgroundColor: Colors.redAccent,
    //       snackPosition: SnackPosition.BOTTOM,
    //       dismissDirection: SnackDismissDirection.HORIZONTAL);
    // }
  }
}
