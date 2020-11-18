import 'package:delivery_store/app/modules/layout/views/layout_view.dart';
import 'package:delivery_store/app/modules/layout/bindings/layout_binding.dart';
import 'package:delivery_store/app/modules/create_product/views/create_product_view.dart';
import 'package:delivery_store/app/modules/create_product/bindings/create_product_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LAYOUT;

  static final routes = [
    GetPage(
      name: Routes.CREATE_PRODUCT,
      page: () => CreateProductView(),
      binding: CreateProductBinding(),
    ),
    GetPage(
      name: Routes.LAYOUT,
      page: () => LayoutView(),
      binding: LayoutBinding(),
    ),
  ];
}
