import 'dart:async';


import 'package:flutter_architecture/data/data_source/remote/api_service.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/setting_repository.dart';
import '../../models/request/get_setting_request.dart';
import '../../models/response/get_setting_response.dart';
import '../../models/setting/setting_model.dart';

@Injectable(as: SettingRepository)
class SettingRepoImpl implements SettingRepository{
  ApiService? api;
  SettingRepoImpl({this.api});

  @override
  FutureOr<GetSettingResponse> getSetting(GetSettingRequest? request) {
    if (request == null || request.test == null) {
      throw NullThrownError();
    }
    return GetSettingResponse.fromJson({'data': SettingModel.fromJson({'test' : "test"}).toJson()});
  }

}