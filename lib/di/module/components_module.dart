import 'package:configuration/data/common/shared_preferences_manager.dart';
import 'package:configuration/di/di_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComponentsModule extends DIModule {
  @override
  provides() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton(SharedPreferencesManager(sharedPreferences));
  }
}
