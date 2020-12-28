import 'package:delivery_store/app/data/model/store.dart';
import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository({@required this.provider}) : assert(provider != null);

  create(StoreModel store, UserModel user) => provider.create(store, user);
}
