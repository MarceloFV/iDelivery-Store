import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String cpf;
  final String email;
  final Address adress;
  DocumentReference reference;

  UserModel({this.name, this.cpf, this.email, this.adress});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cpf': cpf,
      'email': email,
      'adress': adress?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      name: map['name'],
      cpf: map['cpf'],
      email: map['email'],
      adress: Address.fromMap(map['adress']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, cpf: $cpf, email: $email, adress: $adress, reference: $reference)';
  }
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
