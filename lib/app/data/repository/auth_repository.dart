import 'package:delivery_store/app/data/provider/auth_provider.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository({@required this.provider}) : assert(provider != null);

  Future<String> login(email, password) => provider.login(email, password);

  Future<String> register(email, password) => provider.register(email, password);

  Future<void> logout() => provider.logout();

  String getCurrentUID() => provider.getCurrentUserId();
}
