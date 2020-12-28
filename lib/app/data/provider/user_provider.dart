import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:meta/meta.dart';

const collectionPath = 'userInfo';

class UserProvider {
  final FirebaseFirestore firestore;

  UserProvider({@required this.firestore});

  create(StoreModel store, UserModel user) =>
      store.reference.collection(collectionPath).add(user.toMap());
}
