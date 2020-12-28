import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:delivery_store/app/data/model/product_model.dart';
import 'package:delivery_store/app/data/model/user_model.dart';

class RequestModel {
  final List<RequestOrderModel> orders;
  final RequestUserModel user;
  RequestModel({
    this.orders,
    this.user,
  });
}

class RequestUserModel {
  final String name;
  final String phone;
  final AddressModel address;
  RequestUserModel({
    this.name,
    this.phone,
    this.address,
  });
}

class RequestOrderModel {
  final ProductModel product;
  final int amount;
  final String message;
  final double value;
  RequestOrderModel({
    this.product,
    this.amount,
    this.message,
    this.value,
  });
}


/*


import 'package:flutter/foundation.dart';


  RequestModel({
    this.orders,
    this.user,
    this.store
  });

  Map<String, dynamic> toMap() {
    return {
      'orders': orders?.map((x) => x?.toMap())?.toList(),
      'user': user?.toMap(),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RequestModel(
      orders: List<RequestOrderModel>.from(map['orders']?.map((x) => RequestOrderModel.fromMap(x))),
      user: RequestUserModel.fromMap(map['user']),
      store: StoreModel.fromMap(map['store']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source));
}

class RequestUserModel {
  final String name;
  final String phone;
  final AddressModel address;

  RequestUserModel({
    this.name,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address?.toMap(),
    };
  }

  factory RequestUserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RequestUserModel(
      name: map['name'],
      phone: map['phone'],
      address: AddressModel.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestUserModel.fromJson(String source) =>
      RequestUserModel.fromMap(json.decode(source));
}

class RequestOrderModel {
  ProductModel product;
  int amount;
  String message;
  double value;

  RequestOrderModel({
    this.product,
    this.amount,
    this.message,
    this.value,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RequestOrderModel &&
        o.product == product &&
        o.amount == amount &&
        o.message == message &&
        o.value == value;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        amount.hashCode ^
        message.hashCode ^
        value.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product?.toMap(),
      'amount': amount,
      'message': message,
      'value': value,
    };
  }

  factory RequestOrderModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RequestOrderModel(
      product: ProductModel.fromMap(map['product']),
      amount: map['amount'],
      message: map['message'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestOrderModel.fromJson(String source) => RequestOrderModel.fromMap(json.decode(source));
}

*/
