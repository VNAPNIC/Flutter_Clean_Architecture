import 'dart:async';


import 'package:injectable/injectable.dart';

import '../../domain/repositories/setting_repository.dart';
import '../../models/request/get_setting_request.dart';
import '../../models/response/get_setting_response.dart';
import '../../models/setting/setting_model.dart';
import '../data_source/remote/apis.dart';

@Injectable(as: SettingRepository)
class SettingRepoImpl implements SettingRepository{
  Apis? api;
  SettingRepoImpl({this.api});

  @override
  FutureOr<GetSettingResponse> getSetting(GetSettingRequest? request) {
    if (request == null || request.test == null) {
      throw NullThrownError();
    }
    return GetSettingResponse.fromJson({'data': SettingModel.fromJson({'test' : "test"}).toJson()});
  }

}