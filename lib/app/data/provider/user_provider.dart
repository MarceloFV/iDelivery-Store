import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const collectionPath = 'storeOwners';

class UserProvider {

final FirebaseFirestore firestore;
final FirebaseAuth firebaseAuth;

  UserProvider({this.firestore, this.firebaseAuth});



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

add(obj) async{
  // try {
  //   var response = await httpClient.post( baseUrl,
  //     headers: {'Content-Type':'application/json'},
  //     body: jsonEncode(obj) );
  //   if(response.statusCode == 200){
  //     // TODO: implement methods!
  //   }else print ('erro -post'); 
  // } catch(_){ }
}

edit(obj) async{
  // try {
  //   var response = await httpClient.put( baseUrl,
  //     headers: {'Content-Type':'application/json'},
  //     body: jsonEncode(obj) );
  //   if(response.statusCode == 200){
  //     // TODO: implement methods!
  //   }else print ('erro -post'); 
  // } catch(_){ }
}

delete(obj) async{
//   try {
//     var response = await httpClient.delete( baseUrl);
//       if(response.statusCode == 200){
//         // TODO: implement methods!
//       }else print ('erro -post'); 
//   } catch(_){ }
}

}