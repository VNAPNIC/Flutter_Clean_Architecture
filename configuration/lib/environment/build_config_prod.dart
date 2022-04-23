import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.prod])
class BuildConfigProd extends BuildConfig {
  @override
  String get baseUrl => 'Base Url prod';
}
