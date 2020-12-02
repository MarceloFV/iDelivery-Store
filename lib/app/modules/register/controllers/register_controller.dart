import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final UserRepository repository;

  RegisterController({@required this.repository}) : assert(repository != null);

  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  Worker worker;

  final newUser = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
  }


  register() async {
    // try {
      // UserModel user = UserModel(
      //   name: nameController.text,
      //   email: emailController.text,
      //   isStore: true,
      // );

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
