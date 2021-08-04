import 'package:configuration/data/common/response_code.dart';

class BaseResponse {
  String? timestamp;
  int? code;
  String? message;
  String? error;
  String? token;
  dynamic errorBody;

  BaseResponse(
      {this.timestamp,
      this.code,
      this.message,
      this.error,
      this.token,
      this.errorBody});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'] ?? "";
    code = json['code'] ?? ResponseCode.SERVER_UNKNOWN_ERROR;
    message = json['message'] ?? ResponseCode.SERVER_UNKNOWN_ERROR.message;
    error = json['error'] ?? "";
    token = json['token'] ?? null;
    errorBody = json['errorBody'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timestamp': this.timestamp,
        'code': this.code,
        'message': this.message,
        'error': this.error,
        'token': this.token,
        'errorBody': this.errorBody,
      };
}
