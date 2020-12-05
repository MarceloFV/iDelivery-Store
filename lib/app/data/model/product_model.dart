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
  final String id;
  final String imgUrl;
  final String title;
  final String description;
  // final CategoryType category;
  final double value;
  final String storeId;
  final String storeName;
  final double storeShipPrice;
  final bool isFavorite;
  final bool isAvailable;
  final int likes;
  // final DocumentReference storeReference;
  // final DocumentReference reference;

  ProductModel(
      {this.id,
      this.imgUrl,
      this.title,
      this.description,
      // this.category,
      this.value,
      this.storeId,
      this.storeName,
      this.storeShipPrice,
      this.isFavorite,
      this.isAvailable,
      this.likes,
      // this.storeReference,
      // this.reference,
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      // 'category': category?.toMap(),
      'value': value,
      'storeId': storeId,
      'storeName': storeName,
      'storeShipPrice': storeShipPrice,
      'isFavorite': isFavorite,
      'isAvailable': isAvailable,
      'likes': likes,
      // 'storeReference': storeReference?.toMap(),
      // 'reference': reference?.toMap(),
    };
  }


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ProductModel(
      id: map['id'],
      imgUrl: map['imgUrl'],
      title: map['title'],
      description: map['description'],
      // CategoryType.fromMap(map['category']),
      value: map['value'],
      storeId: map['storeId'],
      storeName: map['storeName'],
      storeShipPrice: map['storeShipPrice'],
      isFavorite: map['isFavorite'],
      isAvailable: map['isAvailable'],
      likes: map['likes'],
      // DocumentReference.fromMap(map['storeReference']),
      // DocumentReference.fromMap(map['reference']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
