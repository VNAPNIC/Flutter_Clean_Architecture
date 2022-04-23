import 'dart:io';

import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/network/interceptor/data_format_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../l10n/l10n.dart';

class ApiException {
  int? _errorCode = ResponseCode.CLIENT_UNKNOWN_ERROR;

  get errorCode => _errorCode ?? ResponseCode.CLIENT_UNKNOWN_ERROR;

  String? _errorMessage = ResponseCode.CLIENT_UNKNOWN_ERROR.message;

  get errorMessage =>
      _errorMessage ?? ResponseCode.CLIENT_UNKNOWN_ERROR.message;

  late DioError exception;

  String? get displayError {
    if (exception.type == DioErrorType.connectTimeout) {
      return S.current.connectTimeout;
    }

    if (exception.type == DioErrorType.receiveTimeout) {
      return S.current.receiveTimeout;
    }

    if (exception.type == DioErrorType.sendTimeout) {
      return S.current.sendTimeout;
    }

    if (exception.type == DioErrorType.other) {
      if (exception.error is SocketException) {
        return S.current.connectionProblemDesc;
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
          try {
            final code = exception.response?.code();
            _errorMessage =
                code?.message ?? ResponseCode.CLIENT_UNKNOWN_ERROR.message;
            _errorCode = code;
          } catch (e) {
            _errorMessage = e.toString();
            // Try to get Dio internal error which might due to service not available
            if (exception.error != null) {
              _errorMessage = exception.error.toString();
            }
            if (exception.response?.statusMessage != null &&
                exception.response?.statusMessage?.isNotEmpty == true) {
              _errorMessage = exception.response?.statusMessage;
            }
          }
        }
        break;
      default:
        {
          switch (exception.type) {
            case DioErrorType.cancel:
              {
                _errorMessage = S.current.cancelled;
                break;
              }
            case DioErrorType.connectTimeout:
            case DioErrorType.receiveTimeout:
            case DioErrorType.sendTimeout:
              {
                _errorMessage = S.current.connectTimeout;
                _errorCode = ResponseCode.NOT_CONNECTION_INTERNET;
              }
              break;
            default:
              {
                if (exception.response?.statusCode == HttpStatus.notFound) {
                  _errorMessage = S.current.serverNotFound;
                  _errorCode = ResponseCode.SERVER_MAINTAIN;
                }
                if (exception.response?.statusCode ==
                    HttpStatus.serviceUnavailable) {
                  _errorMessage = S.current.serverUnknownError;
                  _errorCode = ResponseCode.CLIENT_UNKNOWN_ERROR;
                } else if (exception.error is SocketException) {
                  _errorMessage = S.current.connectionProblem;
                  _errorCode = ResponseCode.NOT_CONNECTION_INTERNET;
                } else if (exception.error is HttpException) {
                  _errorMessage = S.current.connectionProblem;
                  _errorCode = ResponseCode.NOT_CONNECTION_INTERNET;
                }
              }
          }
        }
    }
  }
}
