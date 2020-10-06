part of configuration;

/// authentication by token
class AuthInterceptor extends Interceptor {
  static const String X_API_KEY = 'x-api-key';
  static const String ACCESS_TOKEN = 'Authorization';

  @override
  Future onRequest(RequestOptions options) async {
    options.headers['Accept'] = 'application/json';

    final session = SessionPref.getAccessToken();
    if (session != null) {
      options.headers[ACCESS_TOKEN] = 'Bearer $session';
    }
    return super.onRequest(options);
  }
}