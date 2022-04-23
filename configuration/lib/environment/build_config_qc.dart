import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.qc])
class BuildConfigQc extends BuildConfig {
  @override
  String get baseUrl => 'Base Url qc';
}
