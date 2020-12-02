import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final UserRepository repository;

  RegisterController({@required this.repository}) : assert(repository != null);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Worker worker;

  final newUser = UserModel().obs;

  @override
  void onInit() {
    worker = ever(newUser, onUserCreated);
    super.onInit();
  }

  onUserCreated(UserModel user) {
    if (user != null) Get.offAllNamed(Routes.HOME, arguments: {'user': user});
  }

  register() async {
    // try {
    //   UserModel user = UserModel(
    //     name: nameController.text,
    //     email: emailController.text,
    //     isStore: false,
    //   );

    //   newUser.value =
    //       await repository.createUser(user, passwordController.text);
    //   if (Get.isSnackbarOpen) Get.back();
    //   Get.snackbar("Usuário cadastrado", "Cadastrado com sucesso!");
    // } catch (e) {
    //   if (Get.isSnackbarOpen) Get.back();
    //   Get.snackbar("Falha ao cadastrar usuário", "Tente novamente...");
    // }
  }
}
