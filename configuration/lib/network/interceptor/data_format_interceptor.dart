import 'dart:io';

import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/utility/logging.dart';
import 'package:dio/dio.dart';

class DataFormatInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    Log.info("Interceptor","response:\n${response.toString()}");

    if (response.statusCode != HttpStatus.ok) {
      handler.reject(DioError(
          requestOptions: response.requestOptions,
          response: Response(
            headers: response.headers,
            statusCode: response.statusCode,
            requestOptions: response.requestOptions,
            isRedirect: response.isRedirect,
            statusMessage: response.statusMessage,
            redirects: response.redirects,
            extra: response.extra,
          ),
          type: DioErrorType.other));
      return;
    }

    if (response.statusCode == HttpStatus.ok) {
      final code = response.data == null || response.data["code"] == null
          ? ResponseCode.SERVER_UNKNOWN_ERROR
          : response.data["code"];

      if (code != ResponseCode.SERVER_SUCCESSFULLY) {
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            response: Response(
              headers: response.headers,
              statusCode: response.statusCode,
              data: response.data,
              requestOptions: response.requestOptions,
              isRedirect: response.isRedirect,
              statusMessage: response.statusMessage,
              redirects: response.redirects,
              extra: response.extra,
            ),
            type: DioErrorType.response));
        return;
      }
    }

    super.onResponse(response, handler);
  }
}

extension ServerCode on Response {
  int code() => data == null || data["code"] == null
      ? ResponseCode.SERVER_UNKNOWN_ERROR
      : data["code"];
}
