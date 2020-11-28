import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

const collectionPath = 'requests';

class RequestProvider {

final FirebaseFirestore firestore;
RequestProvider({@required this.firestore});

Future<Stream<QuerySnapshot>> getRequests() async {
    return firestore.collection(collectionPath).snapshots();
  }
}