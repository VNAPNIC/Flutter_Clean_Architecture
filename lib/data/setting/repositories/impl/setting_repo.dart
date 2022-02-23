import 'dart:async';

import 'package:flutter_architecture/data/setting/models/request/get_setting_request.dart';
import 'package:flutter_architecture/data/setting/models/response/get_setting_response.dart';
import 'package:flutter_architecture/data/setting/repositories/setting_repository.dart';

extension GetSetting on SettingRepository {
  FutureOr<GetSettingResponse> getSetting(GetSettingRequest? request) async{
    if (request ==null || request.test == null) {
      throw NullThrownError();
    }
    return GetSettingResponse.fromJson({'test': 'Response: ${request.test}'});
  }
}
