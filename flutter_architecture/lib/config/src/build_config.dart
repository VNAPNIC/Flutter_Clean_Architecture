part of configuration;

enum Flavor { DEVELOPMENT, STAGING, PREPROD, RELEASE }

class BuildConfig {
  const BuildConfig._(
      {@required this.baseUrl,
        @required this.socketUrl,
        @required this.connectTimeout,
        @required this.receiveTimeout,
        @required this.flavor,
        this.color = Colors.blue});

  const BuildConfig._development()
      : this._(
    baseUrl: 'http://.../',
    socketUrl: '',
    connectTimeout: 5000,
    receiveTimeout: 5000,
    flavor: Flavor.DEVELOPMENT,
  );

  const BuildConfig._staging()
      : this._(
      baseUrl: 'http://.../',
      socketUrl: '',
      connectTimeout: 5000,
      receiveTimeout: 5000,
      flavor: Flavor.STAGING);

  const BuildConfig._preprod()
      : this._(
      baseUrl: 'http://.../',
      socketUrl: '',
      connectTimeout: 5000,
      receiveTimeout: 5000,
      flavor: Flavor.PREPROD);

  const BuildConfig._release()
      : this._(
      baseUrl: 'http://.../',
      socketUrl: '',
      connectTimeout: 5000,
      receiveTimeout: 5000,
      flavor: Flavor.RELEASE);

  static BuildConfig _instance;

  static init({flavor}) {
    if (_instance == null) {
      print('╔══════════════════════════════════════════════════════════════╗');
      print('                    Build Flavor: $flavor                       ');
      print('╚══════════════════════════════════════════════════════════════╝');
      switch (flavor) {
        case 'development':
          _instance = const BuildConfig._development();
          break;
        case 'staging':
          _instance = const BuildConfig._staging();
          break;
        case 'preprod':
          _instance = const BuildConfig._preprod();
          break;
        default:
          _instance = const BuildConfig._release();
          break;
      }
    }
    _iniLog(flavor);
  }

  static BuildConfig get() {
    return _instance;
  }

  static _iniLog(flavor) async {
    await Log.init();
    switch (_instance.flavor) {
      case Flavor.DEVELOPMENT:
      case Flavor.STAGING:
      case Flavor.PREPROD:
        Log.setLevel(Level.ALL);
        break;
      case Flavor.RELEASE:
        Log.setLevel(Level.OFF);
        break;
    }
  }

  final String baseUrl;
  final String socketUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final Flavor flavor;
  final Color color;

  static String flavorName() =>
      StringUtils.enumToName(_instance.flavor.toString());

  static bool isRelease() => _instance.flavor == Flavor.RELEASE;

  static bool isProduction() => _instance.flavor == Flavor.PREPROD;

  static bool isStaging() => _instance.flavor == Flavor.STAGING;

  static bool isDevelopment() => _instance.flavor == Flavor.DEVELOPMENT;
}
