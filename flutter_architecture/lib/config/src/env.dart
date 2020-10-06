part of configuration;

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await const MethodChannel('flavor')
          .invokeMethod<String>('getFlavor')
          .then((String flavor) async {
        BuildConfig.init(flavor: flavor);
      }).catchError((error) {});

      await Injection.inject();
      HttpOverrides.global = MyHttpOverrides();
      Style.styleDefault();
      final StatefulWidget app = await onCreate();

      runApp(app);
    }, onError: (Object obj, StackTrace stack) {
      print(obj);
      print(stack);
    });
  }

  FutureOr<StatefulWidget> onCreate();
}
