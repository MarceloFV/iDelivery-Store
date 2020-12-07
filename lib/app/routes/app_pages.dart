import 'package:delivery_store/app/modules/menu/bindings/menu_binding.dart';
import 'package:delivery_store/app/modules/menu/modules/create_product/bindings/create_product_binding.dart';
import 'package:delivery_store/app/modules/menu/modules/create_product/views/create_product_view.dart';
import 'package:delivery_store/app/modules/menu/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:delivery_store/app/modules/menu/modules/edit_product/views/edit_product_view.dart';
import 'package:delivery_store/app/modules/menu/modules/product/bindings/product_binding.dart';
import 'package:delivery_store/app/modules/menu/modules/product/views/product_view.dart';
import 'package:delivery_store/app/modules/menu/views/menu_view.dart';
import 'package:delivery_store/app/modules/request/views/request_view.dart';
import 'package:delivery_store/app/modules/request/bindings/request_binding.dart';
import 'package:delivery_store/app/modules/create_store/views/create_store_view.dart';
import 'package:delivery_store/app/modules/create_store/bindings/create_store_binding.dart';
import 'package:delivery_store/app/modules/splash/views/splash_view.dart';
import 'package:delivery_store/app/modules/splash/bindings/splash_binding.dart';
import 'package:delivery_store/app/modules/register/views/register_view.dart';
import 'package:delivery_store/app/modules/register/bindings/register_binding.dart';
import 'package:delivery_store/app/modules/login/views/login_view.dart';
import 'package:delivery_store/app/modules/login/bindings/login_binding.dart';
import 'package:delivery_store/app/modules/home/views/home_view.dart';
import 'package:delivery_store/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.CREATE_STORE,
      page: () => CreateStoreView(),
      binding: CreateStoreBinding(),
    ),
    GetPage(
      name: Routes.REQUEST,
      page: () => RequestView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
      transition: Transition.rightToLeft,
      children: [
        GetPage(
          name: Routes.PRODUCT,
          page: () => ProductView(),
          binding: ProductBinding(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.CREATE_PRODUCT,
          page: () => CreateProductView(),
          binding: CreateProductBinding(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.EDIT_PRODUCT,
          page: () => EditProductView(),
          binding: EditProductBinding(),
          transition: Transition.rightToLeft,
        ),
      ],
    ),
  ];
}
