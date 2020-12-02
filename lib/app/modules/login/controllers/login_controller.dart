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
    print('login');
    String email = emailController.text;
    String password = passwordController.text;
    var userResponse = await repository.login(email, password);
    if (userResponse != null)
      Get.offAndToNamed(Routes.HOME, arguments: {'user': userResponse});
    else
      print('userResponse ta null');
    print('nem sei se foi mas passou do userResposne');
  }
}
