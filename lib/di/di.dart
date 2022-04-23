import 'package:configuration/di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies({required String env}) async {
  configureConfigurationDependencies(env: env);
  $initGetIt(getIt, environment: env);
}
