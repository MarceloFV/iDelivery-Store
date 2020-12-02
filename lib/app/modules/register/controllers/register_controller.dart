import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
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

  register() async {
    Address address = Address(
      rua: ruaController.text,
      numero: numeroController.text,
      bairro: bairroController.text,
      cep: cepController.text,
    );

    UserModel user = UserModel(
      name: nameController.text,
      cpf: cpfController.text,
      email: emailController.text,
      adress: address,
    );

    String email = emailController.text;
    String password = passwordController.text;

    var userResponse = repository.createUser(email, password, user);

    if (userResponse != null)
      Get.offAndToNamed(Routes.HOME, arguments: {'user': userResponse});
    else
      print('algo deu errado'); //TODO: Definir erro
  }
}
