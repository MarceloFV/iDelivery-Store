import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

const collectionPath = 'stores';

enum StoreStatus {
  Active,
  Created,
  Deleted,
  Updated,
  Error,
}

class StoreProvider {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  StoreProvider({
    @required this.firestore,
    @required this.storage,
  });

  StoreStatus status;

  Future<StoreModel> create(String uid, StoreModel store, File image) async {
    try {
      var ref = firestore.collection(collectionPath).doc(uid);
      await ref.set(store.toMap());

      String imgPath = 'stores/${ref.id}/img.jpg';
      var imgRef = storage.ref(imgPath);

      await imgRef.putFile(image);
      var url = await imgRef.getDownloadURL();

      store = store.copyWith(imgUrl: url, reference: ref);
      await store.reference.update({'imgUrl': store.imgUrl});
      
      status = StoreStatus.Created;
      return store;
    } catch (e) {
      status = StoreStatus.Error;
      return null;
    }
  }

/*
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
*/
  Future<StoreModel> update(StoreModel storeModel) async {
    try {
      await storeModel.reference.update(storeModel.toMap());
      status = StoreStatus.Updated;
      return storeModel;
    } catch (e) {
      status = StoreStatus.Error;
      return null;
    }
  }

  Future<StoreModel> read(String uid) async {
    try {
      var snap = await firestore.collection(collectionPath).doc(uid).get();
      status = StoreStatus.Active;
      return StoreModel.fromDocumentSnapshot(snap);
    } catch (e) {
      status = StoreStatus.Error;
      return null;
    }
  }

  Future<StoreStatus> delete(
    StoreModel storeModel,
  ) async {
    try {
      await storeModel.reference.delete();
      status = StoreStatus.Deleted;
      return StoreStatus.Deleted;
    } catch (e) {
      status = StoreStatus.Error;
      return StoreStatus.Error;
    }
  }
}
