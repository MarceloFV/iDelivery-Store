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

  StoreModel copyWith({
    String title,
    String phoneNumber,
    DocumentReference reference,
    DocumentReference userReference,
  }) {
    return StoreModel(
      title: title ?? this.title,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reference: reference ?? this.reference,
      userReference: userReference ?? this.userReference,
    );
  }

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;
  
  //   return o is StoreModel &&
  //     o.title == title &&
  //     o.phoneNumber == phoneNumber &&
  //     o.reference == reference &&
  //     o.userReference == userReference;
  // }

  // @override
  // int get hashCode {
  //   return title.hashCode ^
  //     phoneNumber.hashCode ^
  //     reference.hashCode ^
  //     userReference.hashCode;
  // }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is StoreModel &&
      o.title == title &&
      o.phoneNumber == phoneNumber &&
      o.reference == reference &&
      o.userReference == userReference;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      phoneNumber.hashCode ^
      reference.hashCode ^
      userReference.hashCode;
  }
}
