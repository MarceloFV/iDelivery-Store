import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;

  ProductProvider({@required this.firestore});

  Future<List<ProductModel>> getProductList() async {
    try {
      List<ProductModel> productList = [];
      QuerySnapshot querySnapshot =
          await firestore.collection(collectionPath).get();

      List<DocumentSnapshot> docs = querySnapshot.docs;

      productList = docs
          .map<ProductModel>((DocumentSnapshot snapshot) =>
              ProductModel.fromDocumentSnapshot(snapshot))
          .toList();

      return productList;
    } catch (_) {
      return [];
    }
  }

  Future<DocumentReference> addProduct(ProductModel product) async {
    try {
      return firestore.collection(collectionPath).add(product.toJson());
    } catch (e) {
      return null;
    }
  }

  Future<DocumentReference> editProduct(ProductModel product) async {
    try {
      await product.reference.update(product.toJson());
      return product.reference;
    } catch (e) {
      return null;
    }
  }

  Future<DocumentReference> deleteProduct(ProductModel product) async {
    try {
      await product.reference.delete();
      return product.reference;
    } catch (e) {
      return null; // TODO: Cuidado com retorno de null
    }
  }
}
