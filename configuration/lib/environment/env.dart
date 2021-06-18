import 'dart:async';
import 'dart:io';

import 'package:configuration/utility/style/style.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await const MethodChannel('flavor')
          .invokeMethod<String>('getFlavor')
          .then((String? flavor) async {
        BuildConfig.init(flavor: flavor);
      }).catchError((error) {});

      await onInjection();
      HttpOverrides.global = MyHttpOverrides();
      Style.styleDefault();
      final StatefulWidget app = await onCreate();

      runApp(app);
    }, onError: (Object obj, StackTrace stack) {
      print(obj);
      print(stack);
    });
  }

  Future? onInjection();

  FutureOr<StatefulWidget> onCreate();
}
