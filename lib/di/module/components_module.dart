import 'package:configuration/data/common/shared_preferences_manager.dart';
import 'package:configuration/di/di_module.dart';

class ComponentsModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton(SharedPreferencesManager());
  }
}
