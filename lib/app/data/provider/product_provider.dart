import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;

  ProductProvider({@required this.firestore});

  Future<List<ProductModel>> getProductList(StoreModel store) async {
    if (store.menu == null) return [];
    List<ProductModel> products = [];
    store.menu.forEach((productReference) async {
      var snap = await productReference.get();
      products
          .add(ProductModel.fromMap(snap.data())); //TODO: Create from Snapshot
    });
    //TODO: ach q essa porra era pra ser future
    return products;
  }

  addProduct(ProductModel product) {
    return firestore.collection(collectionPath).add(product.toMap());
  }
}
