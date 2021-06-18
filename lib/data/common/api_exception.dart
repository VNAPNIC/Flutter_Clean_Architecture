import 'dart:io';

import 'package:dio/dio.dart';
import 'package:configuration/network/interceptor/token_interceptor.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter_architecture/data/common/response_error.dart';

class ApiException {
  String? errorCode;
  String errorMessage = "";
  DioError? exception;

  ApiException({this.exception}) {
    switch (exception?.type) {
      case DioErrorType.response:
        {
          dynamic errorBody = exception?.response?.data ?? "";
          try {
            // try to parse to response error
            ResponseError responseError = ResponseError.fromJson(errorBody);
            errorMessage = responseError.message;
            errorCode = responseError.errorCode;

            // map 401 to meaningful messages
            if (TokenInterceptor.unauthorizedTokenCodes
                .contains(responseError.statusCode)) {
              errorMessage = S.current.invalidCredentials;
            }
          } catch (e) {
            errorMessage = e.toString();

            // Try to get Dio internal error which might due to service not available
            if (exception?.error != null) {
              errorMessage = exception?.error?.toString() ?? "";
            }

            if (exception?.response?.statusMessage != null &&
                exception?.response?.statusMessage?.isNotEmpty == true) {
              errorMessage = exception?.response?.statusMessage ?? "";
            }
          }
        }
        break;
      default:
        {
          switch (exception?.type) {
            case DioErrorType.connectTimeout:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              {
                errorMessage = S.current.connectionTimedOut;
              }
              break;
            default:
              {
                if (exception?.error is SocketException) {
                  errorMessage = S.current.connectionProblem;
                } else if (exception?.error is HttpException) {
                  errorMessage = S.current.connectionProblem;
                }
              }
          }
        }
    }
  }
}
