part of configuration;

class TokenInterceptor extends InterceptorsWrapper {
  static const List<int> unauthorizedTokenCodes = [401];

  @override
  Future onError(DioError error) async{
    if (error.response == null || error.type != DioErrorType.RESPONSE) {
      return;
    }
    if (unauthorizedTokenCodes.contains(error.response.statusCode)) {
      // RequestOptions request = error.response.request;
    }
  }
}