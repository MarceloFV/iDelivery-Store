import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar'),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(32),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(hintText: "Nome"),
              ),
              TextFormField(
                controller: controller.cpfController,
                decoration: InputDecoration(hintText: "CPF"),
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: "Senha"),
                obscureText: true,
              ),
              Divider(),
              Text('Endereço: '),
              TextFormField(
                controller: controller.ruaController,
                decoration: InputDecoration(hintText: "Rua"),
              ),
              TextFormField(
                controller: controller.numeroController,
                decoration: InputDecoration(hintText: "Numero"),
              ),
              TextFormField(
                controller: controller.bairroController,
                decoration: InputDecoration(hintText: "Bairro"),
              ),
              TextFormField(
                controller: controller.cepController,
                decoration: InputDecoration(hintText: "CEP"),
              ),
              
              RaisedButton(
                onPressed: controller.register,
                child: Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
