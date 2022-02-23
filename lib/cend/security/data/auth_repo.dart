
import 'package:cend/cend/security/domain/auth_model.dart';
import 'package:cend/cend/security/domain/session_model.dart';

abstract class AuthRepo{
  Future<SessionModel> signUp(AuthModel authModel);

  Future<SessionModel> signIn(AuthModel authModel);

  Future<void> logout();

  Future<bool> containsSession();

  Future<SessionModel> loadLocalSession();
}