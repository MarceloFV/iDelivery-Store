import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// enum Status {
//   Idle,
//   Created,
//   Connected,
//   Login,
//   Error,
// }

class AuthProvider {
  final FirebaseAuth auth;

  AuthProvider({@required this.auth});

  Future<String> login(email, password) async {
    var creds =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return creds.user.uid;
  }

  Future<void> logout() => auth.signOut();

  String getCurrentUserId() {
    if (auth.currentUser == null) return null;
    return auth.currentUser.uid;
  }

  Future<String> register(email, password) async {
    var creds = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return creds.user.uid;
  }
}
