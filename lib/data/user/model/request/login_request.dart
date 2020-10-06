import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(nullable: false)
class LoginRequest{
  LoginRequest({@required this.user, @required this.password});

  String user;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}