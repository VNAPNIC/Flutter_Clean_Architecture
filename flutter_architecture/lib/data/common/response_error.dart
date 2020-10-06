import 'package:json_annotation/json_annotation.dart';

part 'response_error.g.dart';

@JsonSerializable(nullable: false)
class ResponseError{
  String message;
  int statusCode;
  String errorCode;

  ResponseError(this.message, this.statusCode, this.errorCode);

  factory ResponseError.fromJson(Map<String, dynamic> json) =>
      _$ResponseErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);
}