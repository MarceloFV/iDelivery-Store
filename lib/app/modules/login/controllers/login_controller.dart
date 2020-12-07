import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  final UserRepository repository;

  LoginController({@required this.repository}) : assert(repository != null);

  UserModel userModel;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
    String email = emailController.text;
    String password = passwordController.text;
    UserModel userResponse = await repository.login(email, password);
    if (userResponse != null) {
      if (userResponse.store == null) {
        return Get.offAndToNamed(Routes.HOME,
            arguments: {'user': userResponse});
      }
      return Get.offAllNamed(Routes.CREATE_STORE,
          arguments: {'user': userResponse});
    }
  }
}
