import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/request_model.dart';
import 'package:meta/meta.dart';

const collectionPath = 'requests';

class RequestProvider {
  final FirebaseFirestore firestore;
  RequestProvider({@required this.firestore});

  Stream<List<RequestModel>> requestListStream(String uid) {
    return firestore
        .collection(collectionPath)
        .where('store', isEqualTo: uid)
        .snapshots()
        .map((snap) {
      List<RequestModel> requestList;
      snap.docs.forEach((element) {
        requestList.add(RequestModel.fromDocumentSnapshot(element));
      });
      return requestList;
    });
  }
}
