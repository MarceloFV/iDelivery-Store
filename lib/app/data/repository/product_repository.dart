import 'dart:io';

import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/provider/product_provider.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductProvider provider;

  ProductRepository({@required this.provider}) : assert(provider != null);

  // Future<List<ProductModel>> getAll() => provider.getProductList();

  add(StoreModel store, ProductModel product, File img) => provider.create(store, product, img);

  getAll(store) => provider.readAll(store);

  // uploadFile(File file, product, store) => provider.uploadFile(file, product, store);

}
