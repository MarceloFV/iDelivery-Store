import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;

  ProductProvider({@required this.firestore});

  Future<List<ProductModel>> getAll(StoreModel store) async {
    var query = await store.reference.collection(collectionPath).get();
    List<ProductModel> products = [];
    query.docs.forEach((snap) {
      products.add(ProductModel.fromMap(snap.data()));
    });
    print(products);
    return products;
  }

  add(StoreModel store, ProductModel product) {
    return store.reference.collection(collectionPath).add(product.toMap());
  }
}
