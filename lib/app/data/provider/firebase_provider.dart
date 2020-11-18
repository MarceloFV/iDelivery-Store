import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:meta/meta.dart';

const productsPath = 'products';
const requestsPath = 'requests';

class FirebaseProvider {
  final FirebaseFirestore firestore;
  FirebaseProvider({@required this.firestore});

  Future<List<ProductModel>> getProductList() async {
    try {
      List<ProductModel> productList = [];
      QuerySnapshot querySnapshot =
          await firestore.collection(productsPath).get();

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

  addProduct(ProductModel product) =>
      firestore.collection(productsPath).add(product.toJson());

  Future<Stream<QuerySnapshot>> getRequests() async {
    return firestore.collection(requestsPath).snapshots();
  }
  // getId(id) async {
  //   try {
  //     var response = await httpClient.get(baseUrl);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = json.decode(response.body);
  //       // TODO: implement methods!
  //     } else
  //       print('erro -get');
  //   } catch (_) {}
  // }

  editProduct(ProductModel product) =>
      product.reference.update(product.toJson());

  deleteProduct(ProductModel product) => product.reference.delete();
}
