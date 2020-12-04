import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel {
  int id;
  String name;

  RequestModel({id, name});

  RequestModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }

  RequestModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    this.id = snapshot.data()['id'];
    this.name = snapshot.data()['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
