import 'dart:async';
import 'dart:io';

import 'package:configuration/data/data_source/local/pref/sessions_pref.dart';
import 'package:dio/dio.dart';

enum AuthType{
  NOTHING,
  TOKEN_EXPIRED,
}

StreamController<AuthType> _authStreamController = StreamController.broadcast();
Stream<AuthType> get authStream => _authStreamController.stream;

/// authentication by token
class AuthInterceptor extends Interceptor {
  static const String X_API_KEY = 'x-api-key';
  static const String ACCESS_TOKEN = 'Authorization';

  /// code is 100 then lougout
  /// code 3 retry request with the new token
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = 'application/json';
    final session = SessionPref.getAccessToken();
    if (session != null && session.isNotEmpty)
      options.headers[ACCESS_TOKEN] = 'Bearer $session';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == HttpStatus.ok) {
      final isCodeLogOut = response.data != null &&
          response.data["code"] != null &&
          response.data["code"] == 100;
      if (isCodeLogOut) {
        killSession();
        return null;
      }
    }
    super.onResponse(response, handler);
  }

  void killSession() {
    _authStreamController.sink.add(AuthType.TOKEN_EXPIRED);
  }
}
