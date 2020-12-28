import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;

  LoginController({
    @required this.authRepository,
    @required this.storeRepository,
  }) : assert(authRepository != null);

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
    String uid = await authRepository.login(email, password);
    StoreModel store = await storeRepository.read(uid);
    if (store != null) {
      Get.offAndToNamed(Routes.HOME, arguments: {'store': store});
    }
  }
}
