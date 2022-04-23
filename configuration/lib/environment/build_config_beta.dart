import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.beta])
class BuildConfigBeta extends BuildConfig {
  @override
  String get baseUrl => 'Base Url beta';
}
