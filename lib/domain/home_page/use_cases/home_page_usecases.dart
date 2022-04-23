import 'dart:async';

import 'package:flutter_architecture/domain/repositories/setting_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../models/request/get_setting_request.dart';
import '../../../models/setting/setting_model.dart';

@injectable
class HomepageUseCases {
  final SettingRepository settingRepo;

  HomepageUseCases({required this.settingRepo});

  FutureOr<SettingModel?> getSetting(String? param) async {
    if(param == null) {
      throw NullThrownError();
    }
    final response = await settingRepo.getSetting(GetSettingRequest(param));
    return response?.data;
  }
}
