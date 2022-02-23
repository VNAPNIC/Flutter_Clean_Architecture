import 'dart:async';

import 'package:configuration/environment/env.dart';
import 'package:configuration/route/route_define.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/injection/injection.dart';
import 'manifest.dart';
import 'presentation/main/main_application.dart';

/// EndPoint default
main() {
  SetupEnv();
}

class SetupEnv extends Env {
  @override
  Future? onInjection() async {
    await Injection.inject();
  }

  @override
  FutureOr<void> onCreate() async {
    // await firebaseInitialized();
    initRoute(routerIds);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    setStyleDefault();
  }

  @override
  Widget onCreateView() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    return const MainApplication();
  }
}
