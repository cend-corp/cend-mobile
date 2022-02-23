import 'package:cend/cend/security/domain/session_model.dart';
import 'package:cend/configs/app_config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: AppConfig.authUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio) = _AuthClient;

  @POST(AppConfig.signUpUri)
  Future<SessionModel> signUp(@Field('spyWord') spyWord);

  @POST(AppConfig.signInUri)
  Future<SessionModel> signIn(@Field('uuid') login, @Field('spyWord') spyWord);
}