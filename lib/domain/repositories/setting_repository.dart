import 'dart:async';

import '../../models/response/get_setting_response.dart';
import '../../models/request/get_setting_request.dart';

abstract class SettingRepository{
  FutureOr<GetSettingResponse?> getSetting(GetSettingRequest? request);
}