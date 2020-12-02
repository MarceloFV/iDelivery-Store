import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

const collectionPath = 'storeOwners';

enum Status {
  Idle,
  Created,
  Error,
}

class UserProvider {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  UserProvider({this.firestore, this.auth});

  Status userStatus = Status.Idle;

  getAll() async {
    // try {
    //   var response = await httpClient.get(baseUrl);
    //   if(response.statusCode == 200){
    //     Map<String, dynamic> jsonResponse = json.decode(response.body);
    //       List<MyModel> listMyModel = jsonResponse['data'].map<MyModel>((map) {
    //         return MyModel.fromJson(map);
    //       }).toList();
    //     return listMyModel;
    //   }else print ('erro -get');
    // } catch(_){ }
  }

  getId(id) async {
    // try {
    //     var response = await httpClient.get(baseUrl);
    //   if(response.statusCode == 200){
    //     Map<String, dynamic> jsonResponse = json.decode(response.body);
    //       // TODO: implement methods!
    //   }else print ('erro -get');
    // } catch(_){ }
  }

  add(obj) async {
    // try {
    //   var response = await httpClient.post( baseUrl,
    //     headers: {'Content-Type':'application/json'},
    //     body: jsonEncode(obj) );
    //   if(response.statusCode == 200){
    //     // TODO: implement methods!
    //   }else print ('erro -post');
    // } catch(_){ }
  }

  edit(obj) async {
    // try {
    //   var response = await httpClient.put( baseUrl,
    //     headers: {'Content-Type':'application/json'},
    //     body: jsonEncode(obj) );
    //   if(response.statusCode == 200){
    //     // TODO: implement methods!
    //   }else print ('erro -post');
    // } catch(_){ }
  }

  delete(obj) async {
//   try {
//     var response = await httpClient.delete( baseUrl);
//       if(response.statusCode == 200){
//         // TODO: implement methods!
//       }else print ('erro -post');
//   } catch(_){ }
  }

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

  login(email, password) {}
}
