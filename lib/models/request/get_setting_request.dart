import 'package:json_annotation/json_annotation.dart';

part 'get_setting_request.g.dart';

@JsonSerializable()
class GetSettingRequest {
  @JsonKey(name: 'test')
  String? test;

  GetSettingRequest(this.test);

  factory GetSettingRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSettingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSettingRequestToJson(this);
}