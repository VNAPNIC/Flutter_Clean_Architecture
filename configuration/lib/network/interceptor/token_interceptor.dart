import 'package:configuration/data/source/local/sessions_pref.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  static const List<int> unauthorizedTokenCodes = [401];

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      if (response.data is Map) {
        if (response.data["token"] != null) {
          SessionPref.saveSession(
            accessToken: response.data["token"],
            refreshToken: response.data["refreshToken"],
          );
        }
      }
    }
    super.onResponse(response, handler);
  }

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
