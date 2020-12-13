import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  String imgUrl;
  String title;
  String phoneNumber;
  double shipPrice;
  bool isOpen;
  DocumentReference reference;

  StoreModel({
    this.imgUrl,
    this.title,
    this.phoneNumber,
    this.shipPrice,
    this.isOpen,
    this.reference,
  });

  factory StoreModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      StoreModel.fromMap(snapshot.data())
          .copyWith(reference: snapshot.reference);

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'title': title,
      'phoneNumber': phoneNumber,
      'shipPrice': shipPrice,
      'isOpen': isOpen,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return StoreModel(
      imgUrl: map['imgUrl'],
      title: map['title'],
      phoneNumber: map['phoneNumber'],
      shipPrice: map['shipPrice'],
      isOpen: map['isOpen'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreModel.fromJson(String source) =>
      StoreModel.fromMap(json.decode(source));

  StoreModel copyWith({
    String imgUrl,
    String title,
    String phoneNumber,
    double shipPrice,
    bool isOpen,
    DocumentReference reference,
  }) {
    return StoreModel(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      shipPrice: shipPrice ?? this.shipPrice,
      isOpen: isOpen ?? this.isOpen,
      reference: reference ?? this.reference,
    );
  }

  @override
  String toString() {
    return 'StoreModel(imgUrl: $imgUrl, title: $title, phoneNumber: $phoneNumber, shipPrice: $shipPrice, isOpen: $isOpen, reference: $reference)';
  }
}
