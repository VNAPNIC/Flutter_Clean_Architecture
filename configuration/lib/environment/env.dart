import 'dart:async';
import 'dart:io';

import 'package:configuration/network/http_overrides.dart';
import 'package:flutter/material.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() async {
    final StatefulWidget app = FutureBuilder(
      future: await _onCreate(),
      builder: (context, snapshot) {
        return onCreateView();
      },
    );
    runApp(app);
  }

  Future? onInjection();

  FutureOr<void> onCreate();

  Widget onCreateView();

  Future? _onCreate() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    await onInjection();
    await onCreate();
    runApp(onCreateView());
  }
}
