import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;

  ProductProvider({@required this.firestore});

  getProductList() {}

  addProduct(ProductModel product) {}

  
}
