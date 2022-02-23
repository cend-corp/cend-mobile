// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AuthClient implements AuthClient {
  _AuthClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.3.4.66:3000/auth';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SessionModel> signUp(spyWord) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'spyWord': spyWord};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SessionModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/signUp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SessionModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SessionModel> signIn(login, spyWord) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'uuid': login, 'spyWord': spyWord};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SessionModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/signIn',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SessionModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
