import 'package:configuration/di/di_module.dart';
import 'package:flutter_architecture/data/setting/repositories/setting_repository.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<SettingRepository>(
      () => SettingRepository(
        api: getIt.get(),
      ),
    );
  }
}
