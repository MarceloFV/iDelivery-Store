import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

const collectionPath = 'products';

class ProductProvider {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  ProductProvider({
    @required this.firestore,
    @required this.storage,
  });

  Future<List<ProductModel>> getAll(StoreModel store) async {
    var query = await store.reference.collection(collectionPath).get();
    List<ProductModel> products = [];
    query.docs.forEach((snap) {
      products.add(ProductModel.fromDocumentSnapshot(snap));
    });
    return products;
  }

  Future<ProductModel> add(
      StoreModel store, ProductModel product, File img) async {
    product = await store.reference
        .collection(collectionPath)
        .add(product.toMap())
        .then((ref) => product.copyWith(reference: ref));
    String imgPath =
        'stores/${store.reference.id}/products/${product.reference.id}/1.jpg';
    var imgRef = storage.ref(imgPath);
    await imgRef.putFile(img);
    var url = await imgRef.getDownloadURL();
    await product.reference.update({'imgUrl': url});
    product = product.copyWith(imgUrl: url);
    return product;
  }

  // uploadFile(File file, ProductModel product, store) async {
  //   product = await store.reference
  //       .collection(collectionPath)
  //       .add(product.toMap())
  //       .then((ref) => product.copyWith(reference: ref));

  //   var imgRef = storage.ref(imgPath);
  //   await imgRef.putFile(file);
  //   var url = await imgRef.getDownloadURL();
  //   await product.reference.update({'imgUrl': url});
  //   product = product.copyWith(imgUrl: url);
  //   return product;
  // }
}
