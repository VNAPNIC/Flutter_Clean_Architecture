import 'dart:async';
import 'package:flutter_architecture/data/setting/models/request/get_setting_request.dart';
import 'package:flutter_architecture/data/setting/models/response/get_setting_response.dart';
import 'package:flutter_architecture/data/setting/repositories/impl/setting_repo.dart';
import 'package:flutter_architecture/data/setting/repositories/setting_repository.dart';

class HomepageUseCases {
  final SettingRepository settingRepo;
  HomepageUseCases(this.settingRepo);

  FutureOr<GetSettingResponse> getSetting(GetSettingRequest? request) =>
      settingRepo.getSetting(request);
}
