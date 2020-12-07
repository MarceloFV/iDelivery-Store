import 'package:delivery_store/app/data/model/store_model.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/provider/store_provider.dart';
import 'package:meta/meta.dart';

class StoreRepository {
  final StoreProvider provider;

  StoreRepository({@required this.provider}) : assert(provider != null);

  createStore(String uid, StoreModel store) => provider.createStore(uid, store);

  addProductReferenceToMenu(store, reference) =>
      provider.addProductReferenceToMenu(store, reference);

  Future<StoreModel> getStore(String uid) => provider.getStore(uid);

  getStoreFromID() {}
//TODO: Implement StoreRepository
}
