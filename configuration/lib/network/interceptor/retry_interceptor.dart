import 'dart:io';

import 'package:dio/dio.dart';

class RetryInterceptor extends InterceptorsWrapper {
  final Dio dio;
  final requestMaps = <String, int>{};
  final canRetry = true;

  RetryInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.data is Map<String, dynamic>) {
      final key = response.requestOptions.data['api'];
      if (key != null) {
        requestMaps[key] = -2;
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.forbidden ||
        err.response?.statusCode == HttpStatus.badGateway ||
        err.response?.statusCode == HttpStatus.gatewayTimeout ||
        err.response?.statusCode == HttpStatus.networkConnectTimeoutError ||
        err.response?.statusCode == HttpStatus.requestTimeout ||
        err.error == DioErrorType.connectTimeout ||
        err.error == DioErrorType.receiveTimeout ||
        err.error == DioErrorType.sendTimeout ||
        err.error is SocketException) {
      dio.interceptors.responseLock.lock();

      await Future.delayed(Duration(seconds: 4));

      if (err.requestOptions.data is Map<String, dynamic>) {
        _retry(
          err.requestOptions.path,
          err.requestOptions.data as Map<String, dynamic>,
          err.requestOptions.method,
          err.requestOptions.headers,
        );
      }
    }
    super.onError(err, handler);
  }

  _retry(path, Map<String, dynamic> data, method, headers) {
    // set key with value of the key api
    final key = data['api'];
    if (key == null) return;

    if (requestMaps[key] == null ||
        requestMaps[key]! == -2 ||
        requestMaps[key]! > 0) {
      if (requestMaps[key] == null || requestMaps[key]! == -2)
        requestMaps[key] = 10;

      requestMaps[key] = requestMaps[key]! - 1;

      dio.interceptors.responseLock.unlock();

      final opts = new Options(
        method: method,
        headers: headers,
      );

      dio.request(
        path,
        data: data,
        options: opts,
      );
    }
  }
}
