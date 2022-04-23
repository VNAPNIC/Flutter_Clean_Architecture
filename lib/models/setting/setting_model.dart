import 'package:json_annotation/json_annotation.dart';

part 'setting_model.g.dart';

@JsonSerializable()
class SettingModel{
  @JsonKey(name: 'test')
  String? test;

  SettingModel(this.test);

  factory SettingModel.fromJson(Map<String, dynamic> json) =>
      _$SettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingModelToJson(this);
}