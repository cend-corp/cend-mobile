import 'dart:convert';

import 'package:cend/cend/security/data/auth_client.dart';
import 'package:cend/cend/security/data/auth_repo.dart';
import 'package:cend/cend/security/domain/auth_model.dart';
import 'package:cend/cend/security/domain/session_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepoImpl extends AuthRepo {
  late AuthClient client;
  final FlutterSecureStorage storage;

  AuthRepoImpl(this.storage) {
    client = AuthClient(Dio());
  }

  @override
  Future<void> logout() async {}

  @override
  Future<SessionModel> signIn(AuthModel authModel) async {
    var session = await client.signIn(authModel.uuid, authModel.spyWord);
    await storage.write(key: 'session', value: jsonEncode(session.toJson()));
    return session;
  }

  @override
  Future<SessionModel> signUp(AuthModel authModel) async {
    var session = await client.signUp(authModel.spyWord);
    await storage.write(key: 'session', value: jsonEncode(session.toJson()));
    return session;
  }

  @override
  Future<bool> containsSession() async{
    return false;
  }

  @override
  Future<SessionModel> loadLocalSession() async{
    return SessionModel('','','');
  }
}
