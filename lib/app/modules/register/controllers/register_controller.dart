import 'dart:io';

import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/repository/store_repository.dart';
import 'package:delivery_store/app/data/repository/auth_repository.dart';
import 'package:delivery_store/app/data/repository/user_repository.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;
  final StoreRepository storeRepository;
  final UserRepository userRepository;

  RegisterController({
    @required this.authRepository,
    @required this.storeRepository,
    @required this.userRepository,
  }) : assert(authRepository != null);

  TextEditingController nameController = TextEditingController();
  var cpfController = new MaskedTextController(mask: '000.000.000-00');
  var userPhoneController = new MaskedTextController(mask: '(00) 00000-0000');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  var phoneController = new MaskedTextController(mask: '(00) 00000-0000');
  var shipController = new MoneyMaskedTextController(leftSymbol: 'R\$ ');

  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  var cepController = new MaskedTextController(mask: '00000-000');

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
    AddressModel address = AddressModel(
      rua: ruaController.text,
      numero: numeroController.text,
      bairro: bairroController.text,
      cep: cepController.text,
    );

    UserModel userModel = UserModel(
      name: nameController.text,
      phone: userPhoneController.text,
      cpf: cpfController.text,
      email: emailController.text,
      address: address,
    );

    StoreModel storeModel = StoreModel(
      title: titleController.text,
      phoneNumber: phoneController.text,
      shipPrice: shipController.numberValue,
    );

    String email = emailController.text;
    String password = passwordController.text;
    String uid = await authRepository.register(email, password);
    // String mockedUID = 'sduhisaduhdsaiuhsd'; //TODO: Exclude

    var store = await storeRepository.createStore(uid, storeModel, image);

    await userRepository.create(store, userModel);

    if (store != null)
      Get.offAllNamed(Routes.HOME, arguments: {'store': store});
    else
      print('algo deu errado'); //TODO: Definir erro
  }
}
