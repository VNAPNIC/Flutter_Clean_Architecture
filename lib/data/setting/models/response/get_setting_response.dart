import 'package:json_annotation/json_annotation.dart';

part 'get_setting_response.g.dart';

@JsonSerializable()
class GetSettingResponse {

  @JsonKey(name: 'test')
  String? test;

  GetSettingResponse(this.test);

  factory GetSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSettingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSettingResponseToJson(this);
}