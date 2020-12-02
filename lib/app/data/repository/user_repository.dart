import 'package:delivery_store/app/data/provider/user_provider.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final UserProvider provider;

  UserRepository({@required this.provider}) : assert(provider != null);

  createUser(email, password, user) => provider.create(email, password, user);

  login(email, password) => provider.login(email, password);
}
