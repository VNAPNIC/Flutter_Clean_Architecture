import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.qc])
class BuildConfigQc extends BuildConfig {
  @override
  String get host => 'https://.../';

  @override
  String get hostSocketIO => 'wss://...';
}
