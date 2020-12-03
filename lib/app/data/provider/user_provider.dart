import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

const collectionPath = 'storeOwners';

enum Status {
  Idle,
  Created,
  Connected,
  Login,
  Error,
}

class UserProvider {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  UserProvider({this.firestore, this.auth});

  Status userStatus = Status.Idle;

  create(String email, String password, UserModel user) async {
    assert(user != null);
    if (user == null) {
      userStatus = Status.Error;
      return null;
    }
    try {
      var credentials = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var reference =
          firestore.collection(collectionPath).doc(credentials.user.uid);
      reference.set(user.toMap());
      userStatus = Status.Created;
      user.reference = reference;
      return user;
    } catch (e) {
      userStatus = Status.Error;
      return null;
    }
  }

  login(email, password) async {
    try {
      userStatus = Status.Login;
      var credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      var reference =
          firestore.collection(collectionPath).doc(credentials.user.uid);
      var snap = await reference.get();
      var user = UserModel.fromMap(snap.data());
      user.reference = reference;
      userStatus = Status.Connected;
      return user;
    } catch (e) {
      userStatus = Status.Error;
      return null;
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      var uid = auth.currentUser.uid;
      var snap = await firestore.collection(collectionPath).doc(uid).get();
      UserModel user = UserModel.fromDocumentSnapshot(snap);
      return user;
    } catch (e) {
      return null;
    }
  }
}
