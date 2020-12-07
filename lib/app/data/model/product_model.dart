import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

enum CategoryType {
  Hamburguer,
  Pizza,
  Sorvete,
  Bolo,
  Hotdog,
  Pastel,
}

class ProductModel {
  final String imgUrl;
  final String title;
  final String description;
  final double value;
  final bool isAvailable;
  final int likes;
  // final CategoryType category;
  final DocumentReference reference;

  ProductModel({
    this.imgUrl,
    this.title,
    this.description,
    this.value,
    this.isAvailable,
    this.likes,
    this.reference,
  });

  Map<String, dynamic> toMap() => {
        'imgUrl': imgUrl,
        'title': title,
        'description': description,
        'value': value,
        'isAvailable': isAvailable,
        'likes': likes,
      };

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      ProductModel.fromMap(snapshot.data())
          .copyWith(reference: snapshot.reference);

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductModel(
      imgUrl: map['imgUrl'],
      title: map['title'],
      description: map['description'],
      value: map['value'],
      isAvailable: map['isAvailable'],
      likes: map['likes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  ProductModel copyWith({
    String imgUrl,
    String title,
    String description,
    double value,
    bool isAvailable,
    int likes,
    DocumentReference reference,
  }) {
    return ProductModel(
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      value: value ?? this.value,
      isAvailable: isAvailable ?? this.isAvailable,
      likes: likes ?? this.likes,
      reference: reference ?? this.reference,
    );
  }
}
