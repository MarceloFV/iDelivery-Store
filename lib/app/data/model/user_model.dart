import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String cpf;
  final String email;
  final String phone;
  final Address address;
  DocumentReference reference;

  UserModel({
    this.name,
    this.cpf,
    this.email,
    this.phone,
    this.address,
    this.reference,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) =>
      UserModel.fromMap(snapshot.data()).copyWith(
        reference: snapshot.reference,
      );

  UserModel copyWith({
    String name,
    String cpf,
    String email,
    String phone,
    Address adress,
    DocumentReference reference,
  }) {
    return UserModel(
      name: name ?? this.name,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: adress ?? this.address,
      reference: reference ?? this.reference,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'email': email,
      'phone': phone,
      'adress': address?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      name: map['name'],
      cpf: map['cpf'],
      email: map['email'],
      phone: map['phone'],
      address: Address.fromMap(map['adress']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}

class Address {
  final String bairro;
  final String rua;
  final String numero;
  final String cep;

  Address({this.bairro, this.rua, this.numero, this.cep});

  Map<String, dynamic> toMap() {
    return {
      'bairro': bairro,
      'rua': rua,
      'numero': numero,
      'cep': cep,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      bairro: map['bairro'],
      rua: map['rua'],
      numero: map['numero'],
      cep: map['cep'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
