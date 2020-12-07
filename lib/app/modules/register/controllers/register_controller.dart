import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;

  RegisterController(
      {@required this.authRepository, @required this.storeRepository})
      : assert(authRepository != null);

  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shipController = TextEditingController();

  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cepController = TextEditingController();

//TODO: conferir se existem erros quando criar loja

  register() async {
    // Address address = Address(
    //   rua: ruaController.text,
    //   numero: numeroController.text,
    //   bairro: bairroController.text,
    //   cep: cepController.text,
    // );

    //TODO: Adicionar mais informaçoes dentro do store;
    StoreModel storeModel = StoreModel(
      title: titleController.text,
      phoneNumber: phoneController.text,
      shipPrice: double.parse(shipController.text),
    );

    String email = emailController.text;
    String password = passwordController.text;

    String uid = await authRepository.register(email, password);

    var store = await storeRepository.createStore(uid, storeModel);

    if (store != null)
      Get.offAllNamed(Routes.HOME, arguments: {'store': store});
    else
      print('algo deu errado'); //TODO: Definir erro
  }
}
