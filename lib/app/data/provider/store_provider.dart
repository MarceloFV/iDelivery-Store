import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/store_model.dart';
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
  StoreProvider({@required this.firestore});

  StoreStatus status;

  createStore(String uid, StoreModel store) async {
    try {
      var ref = firestore.collection(collectionPath).doc(uid);
      await ref.set(store.toMap());
      status = StoreStatus.Created;
      store = store.copyWith(reference: ref);
      return store;
    } catch (e) {
      status = StoreStatus.Error;
      return null;
    }
  }

  Future<StoreModel> updateStore(StoreModel storeModel) async {
    try {
      await storeModel.reference.update(storeModel.toMap());
      status = StoreStatus.Updated;
      return storeModel;
    } catch (e) {
      status = StoreStatus.Error;
      return null;
    }
  }

  Future<StoreModel> readStore(String uid) async {
    try {
      var snap = await firestore.collection(collectionPath).doc(uid).get();
      status = StoreStatus.Active;
      return StoreModel.fromDocumentSnapshot(snap);
    } catch (e) {
      status = StoreStatus.Error;
      return null;
    }
  }

  Future<StoreStatus> deleteStore(StoreModel storeModel) async {
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
