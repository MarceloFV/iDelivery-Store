import 'package:delivery_store/app/data/model/user_model.dart';
import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository({@required this.provider}) : assert(provider != null);

  createUser(email, password, user) => provider.create(email, password, user);

  login(email, password) => provider.login(email, password);

  logout() => provider.logout();

  getCurrentUser() => provider.getCurrentUser();

  getCurrentUserId() => provider.getCurrentUserId();

  updateUser(UserModel user) => provider.updateUser(user);

  attachStoreToUser(UserModel user) => provider.attachStoreToUser(user);
}
