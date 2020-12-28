import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/request.dart';
import 'package:delivery_store/app/data/model/store.dart';
import 'package:meta/meta.dart';

const collectionPath = 'requests';

class RequestProvider {
  final FirebaseFirestore firestore;
  RequestProvider({
    @required this.firestore,
  });

  Stream<List<RequestModel>> requestStream(StoreModel store) =>
      store.reference.collection(collectionPath).snapshots().map((event) =>
          event.docs.map((e) => RequestModel.fromDocumentSnapshot(e)).toList());
}
