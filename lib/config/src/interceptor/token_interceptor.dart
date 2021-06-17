part of configuration;

class TokenInterceptor extends InterceptorsWrapper {
  static const List<int> unauthorizedTokenCodes = [401];

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    if (error.response == null || error.type != DioErrorType.response) {
      return;
    }
    if (unauthorizedTokenCodes.contains(error.response?.statusCode)) {
      // RequestOptions request = error.response.request;
    }
    super.onError(error, handler);
  }
}