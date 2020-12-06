import 'dart:convert';

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
  // final DocumentReference reference; //TODO: Implement reference

  ProductModel({
    this.imgUrl,
    this.title,
    this.description,
    this.value,
    this.isAvailable,
    this.likes,
    // this.reference,
  });

  Map<String, dynamic> toMap() =>
     {
      'imgUrl': imgUrl,
      'title': title,
      'description': description,
      'value': value,
      'isAvailable': isAvailable,
      'likes': likes,
      // 'reference': reference?.toMap(),
    };
  

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductModel(
      imgUrl: map['imgUrl'],
      title: map['title'],
      description: map['description'],
      value: map['value'],
      isAvailable: map['isAvailable'],
      likes: map['likes'],
      // CategoryType.fromMap(map['category']),
      // DocumentReference.fromMap(map['reference']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));
}
