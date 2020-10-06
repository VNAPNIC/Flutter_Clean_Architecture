import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/common/response_error.dart';
import 'package:flutter_architecture/generated/l10n.dart';

class ApiException {
  String errorCode;
  String errorMessage = "";
  DioError exception;
  ApiException({DioError exception}) {
    this.exception = exception;

    switch (exception.type) {
      case DioErrorType.RESPONSE:
        {
          dynamic errorBody = exception.response.data;
          try {
            // try to parse to response error
            ResponseError responseError =
            ResponseError.fromJson(errorBody);
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
            if (exception.error != null) {
              errorMessage = exception.error.toString();
            }

            if (exception.response.statusMessage != null &&
                exception.response.statusMessage.isNotEmpty) {
              errorMessage = exception.response.statusMessage;
            }
          }
        }
        break;
      default:
        {
          switch (exception.type) {
            case DioErrorType.CONNECT_TIMEOUT:
            case DioErrorType.RECEIVE_TIMEOUT:
            case DioErrorType.SEND_TIMEOUT:
              {
                errorMessage = S.current.connectionTimedOut;
              }
              break;
            default:
              {
                if (exception.error is SocketException) {
                  errorMessage = S.current.connectionProblem;
                } else if (exception.error is HttpException) {
                  errorMessage = S.current.connectionProblem;
                }
              }
          }
        }
    }
  }
}