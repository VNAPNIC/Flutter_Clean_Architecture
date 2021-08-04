import 'dart:io';

import 'package:configuration/data/common/base_response.dart';
import 'package:dio/dio.dart';

class DataFormatInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == HttpStatus.preconditionFailed) {
      handler.reject(DioError(
          requestOptions: response.requestOptions,
          response: Response<BaseResponse?>(
            data: BaseResponse.fromJson(response.data),
            requestOptions: response.requestOptions,
          ),
          type: DioErrorType.response));
      return;
    }

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

    super.onResponse(response, handler);
  }
}
