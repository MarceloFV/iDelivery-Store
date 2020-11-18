import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String name;
  double value;
  DocumentReference storeReference;
  DocumentReference reference;

  ProductModel({
    this.name,
    this.value,
    this.storeReference,
    this.reference,
  });

  factory ProductModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      ProductModel(
        name: snapshot.data()['name'],
        value: snapshot.data()['value'],
        storeReference: snapshot.data()['storeReference'],
        reference: snapshot.reference,
      );

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'value': this.value,
        'storeReference': this.storeReference,
      };
}
