import 'dart:io';
import 'package:configuration/data/common/base_response.dart';
import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiException {
  late int? errorCode;
  late String? errorMessage = "";
  late dynamic errorBody = "";
  late DioError exception;

  String? get displayError {
    if (exception.type == DioErrorType.connectTimeout) {
      return S.current.connect_timeout;
    }

    if (exception.type == DioErrorType.receiveTimeout) {
      return S.current.receive_timeout;
    }

    if (exception.type == DioErrorType.sendTimeout) {
      return S.current.send_timeout;
    }

    if (exception.type == DioErrorType.other) {
      if (exception.error is SocketException) {
        return S.current.please_check_internet_connection;
      }
      return exception.error.toString();
    }

    // Prioritize error returned in response body
    final responseData = exception.response?.data;
    if (responseData is Map && responseData["message"] != null) {
      final message = responseData["message"];
      if (message is List) {
        return message
            .map((e) => toBeginningOfSentenceCase(e.toString()))
            .join("\n");
      }

      return toBeginningOfSentenceCase(message.toString());
    }

    if (responseData is Map && responseData["error"] != null) {
      return responseData["error"].toString();
    }

    // Fallback to request error if no error returned in response body
    return exception.error?.toString() ?? exception.response?.statusMessage;
  }

  ApiException({required DioError exception}) {
    this.exception = exception;
    switch (exception.type) {
      case DioErrorType.response:
        {
          dynamic data = exception.response?.data;
          try {
            if (data is BaseResponse) {
              errorMessage = data.code == ResponseCode.UNAUTHORIZED ||
                      data.code == ResponseCode.FORBIDDEN
                  ? S.current.invalid_credentials
                  : data.code?.message ?? data.error;

              errorCode = data.code;
              errorBody = data.errorBody;
            }
          } catch (e) {
            errorMessage = e.toString();
            // Try to get Dio internal error which might due to service not available
            if (exception.error != null) {
              errorMessage = exception.error.toString();
            }
            if (exception.response?.statusMessage != null &&
                exception.response?.statusMessage?.isNotEmpty == true) {
              errorMessage = exception.response?.statusMessage;
            }
          }
        }
        break;
      default:
        {
          switch (exception.type) {
            case DioErrorType.cancel:
              {
                errorMessage = S.current.cancelled;
                break;
              }
            case DioErrorType.connectTimeout:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              {
                errorMessage = S.current.connect_timeout;
              }
              break;
            default:
              {
                if (exception.response?.statusCode == HttpStatus.notFound) {
                  errorMessage = S.current.server_not_found;
                }
                if (exception.response?.statusCode ==
                    HttpStatus.serviceUnavailable) {
                  errorMessage = S.current.server_unknown_error;
                } else if (exception.error is SocketException) {
                  errorMessage = S.current.connection_problem;
                } else if (exception.error is HttpException) {
                  errorMessage = S.current.connection_problem;
                }
              }
          }
        }
    }
  }
}
