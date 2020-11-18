import 'package:delivery_store/app/modules/layout/views/home_view.dart';
import 'package:delivery_store/app/modules/layout/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_store/app/modules/layout/controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          children: <Widget>[
            HomeView(),
            ProductsView(),
            Container(color: Colors.red),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          onTap: controller.onItemTapped,
          currentIndex: controller.currentIndex,
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({Key key, this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'Produtos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
