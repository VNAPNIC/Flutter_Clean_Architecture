import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/common/shared_preferences_manager.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class ComponentsModule extends DIModule{
  @override
  provides() async{
    getIt.registerSingleton(SharedPreferencesManager());
  }
}