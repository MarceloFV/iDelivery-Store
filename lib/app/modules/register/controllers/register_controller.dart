import 'dart:io';

import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

//TODO: Adicionar imagem a loja

File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      //TODO: Implement no image selected
    }
  }

  register() async {
    StoreModel storeModel = StoreModel(
      title: titleController.text,
      phoneNumber: phoneController.text,
      shipPrice: double.parse(shipController.text),
    );


//BuPvMjoUAYPXmMhjHRGl26Smn2J2
//RJw3kq7DiiOQ4S76YBtWjpl9rIq2
    String email = emailController.text;
    String password = passwordController.text;

    String uid = await authRepository.register(email, password);


    var store = await storeRepository.createStore(uid, storeModel, image);

    if (store != null)
      Get.offAllNamed(Routes.HOME, arguments: {'store': store});
    else
      print('algo deu errado'); //TODO: Definir erro
  }

  
}
