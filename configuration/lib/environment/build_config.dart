abstract class CustomEnv {
  static const String qc = 'qc';
  static const String beta = 'beta';
  static const String prod = 'prod';
}

abstract class BuildConfig {
  String get baseUrl;
}
