// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_setting_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSettingResponse _$GetSettingResponseFromJson(Map<String, dynamic> json) =>
    GetSettingResponse(
      json['data'] == null
          ? null
          : SettingModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSettingResponseToJson(GetSettingResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
