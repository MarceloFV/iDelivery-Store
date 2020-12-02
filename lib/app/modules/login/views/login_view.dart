import 'package:delivery_store/app/modules/login/controllers/login_controller.dart';
import 'package:delivery_store/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(32),
        child: Column(children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Email", errorText: controller.emailError.value),
            controller: controller.emailController,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Senha", errorText: controller.passwordError.value),
            obscureText: true,
            controller: controller.passwordController,
          ),
          RaisedButton(
            onPressed: controller.login,
            child: Text("Entrar"),
          ),
          FlatButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text("Criar conta"))
        ]),
      ),
    );
  }
}
