import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
@JsonSerializable(nullable: false)
// ignore: must_be_immutable
class LoginResponse extends Equatable {
  LoginResponse(this.accessToken);

  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'refresh_token')
  String refreshToken;

  @JsonKey(name: 'refresh_expires_in')
  int refreshExpiresIn;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object> get props => [accessToken, refreshToken, refreshExpiresIn];
}
