import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá'),
        centerTitle: true,
      ),
      drawer: _drawer(),
      body: Container(
        child: Center(
          child: Obx(() => ElevatedButton(
                child: controller.isOpen.value
                    ? Text('Fechar loja')
                    : Text('Abrir loja'),
                style: controller.isOpen.value
                    ? ElevatedButton.styleFrom(primary: Colors.red)
                    : null,
                onPressed: controller.onOpenCloseStorePressed,
              )),
        ),
      ),
    );
  }

  _drawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: FlutterLogo(),
              title: Text('UaiDelivery'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página inicial'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text('Loja'),
              onTap: () {
                //TODO: Implement goto store page
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Cardápio'),
              onTap: controller.onDrawerMenuPressed,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histórico de pedidos'),
              onTap: () {
                //TODO: Implement goto history page
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                //TODO: Implement goto profile page
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: controller.onLogoutPressed,
            )
          ],
        ),
      ),
    );
  }
}
