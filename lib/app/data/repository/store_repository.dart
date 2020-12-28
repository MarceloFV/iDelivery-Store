import 'dart:io';

import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:meta/meta.dart';

class StoreRepository {
  final StoreProvider provider;

  StoreRepository({@required this.provider}) : assert(provider != null);

  Future<StoreModel> createStore(String uid, StoreModel store, File image) =>
      provider.create(uid, store, image);

  Future<StoreModel> read(String uid) => provider.read(uid);

  void open(StoreModel store) => provider.open(store);
  
  void close(StoreModel store) => provider.close(store);
}
