import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/provider/firebase_provider.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final FirebaseProvider provider;

  ProductRepository({@required this.provider}) : assert(provider != null);

  Future<List<ProductModel>> getAll() => provider.getProductList();

  add(ProductModel product) => provider.addProduct(product);

  Future<Stream<QuerySnapshot>> getStream() => provider.getRequests();

  

// getId(id){
//   return productProvider.getId(id);
// }
// delete(id){
//   return productProvider.delete(id);
// }
// edit(obj){
//   return productProvider.edit( obj );
// }

}
