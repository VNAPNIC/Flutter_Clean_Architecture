abstract class CustomEnv {
  static const String qc = 'qc';
  static const String beta = 'beta';
  static const String prod = 'prod';
}

abstract class BuildConfig {
  // API and socket
  String get host;

  String get hostSocketIO;

  String get apiUrl => '${host}api';
}
