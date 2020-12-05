import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  // final String uid;
  String title;
  String phoneNumber;
  double shipPrice;
  List<DocumentReference> menu;
  DocumentReference reference;

  StoreModel({
    this.title,
    this.phoneNumber,
    this.shipPrice,
    this.reference,
    this.menu,
  });

  factory StoreModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      StoreModel(
        title: snapshot.data()['title'],
        phoneNumber: snapshot.data()['phoneNumber'],
        shipPrice: snapshot.data()['shipPrice'],
        menu: snapshot.data()['menu'],
        reference: snapshot.reference,
      );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'phoneNumber': phoneNumber,
      'shipPrice': shipPrice,
    };
  }

  StoreModel copyWith({
    String title,
    String phoneNumber,
    double shipPrice,
    DocumentReference reference,
  }) {
    return StoreModel(
      title: title ?? this.title,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      shipPrice: shipPrice ?? this.shipPrice,
      reference: reference ?? this.reference,
    );
  }
}
