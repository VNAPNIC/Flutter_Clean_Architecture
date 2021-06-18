import 'package:logging/logging.dart';

class Log {
  static const String _NAME = 'Logger';
  static Logger? _instance;

  static init() async {
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    _instance = Logger(_NAME);
  }

  static void setLevel(Level level) {
    Logger.root.level = level;
  }

  static void info(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.info('$tag: $message', error, stackTrace);
  }

  static void warning(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.warning('$tag: $message', error, stackTrace);
  }

  static void config(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.config('$tag: $message', error, stackTrace);
  }

  static void fine(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.fine(message, error, stackTrace);
  }

  static void finer(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.finer('$tag: $message', error, stackTrace);
  }

  static void finest(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.finest('$tag: $message', error, stackTrace);
  }

  static void severe(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.severe('$tag: $message', error, stackTrace);
  }

  static void shout(String tag, String message,
      [Object? error, StackTrace? stackTrace]) {
    _instance?.shout('$tag: $message', error, stackTrace);
  }
}
