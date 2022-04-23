import 'package:json_annotation/json_annotation.dart';

import '../setting/setting_model.dart';

part 'get_setting_response.g.dart';

@JsonSerializable()
class GetSettingResponse {

  @JsonKey(name: 'data')
  SettingModel? data;

  GetSettingResponse(this.data);

  factory GetSettingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSettingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSettingResponseToJson(this);
}