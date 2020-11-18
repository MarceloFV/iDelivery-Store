import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  final String title;
  final String phoneNumber;
  final DocumentReference reference;
  final DocumentReference userReference;

  StoreModel({
    this.title,
    this.phoneNumber,
    this.userReference,
    this.reference,
  });

  factory StoreModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      StoreModel(
        title: snapshot.data()['title'],
        phoneNumber: snapshot.data()['phoneNumber'],
        userReference: snapshot.data()['userReference'],
        reference: snapshot.reference,
      ); // this.id = json['id'];

  Map<String, dynamic> toJson() => {
        'title': this.title,
        'phoneNumber': this.phoneNumber,
        'userReference': this.userReference
      };
}
