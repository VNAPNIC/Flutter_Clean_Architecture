import 'package:configuration/generated/l10n.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/manifest.dart';
import 'package:flutter_architecture/presentation/home_page/home_page_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication>
    with WidgetsBindingObserver {
  bool canPopDialog = false;

  final route = routerIds[HomePageRoute];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  /// inactive - The application is in an inactive state and is not receiving user input. iOS only
  /// paused - The application is not currently visible to the user, not responding to user input, and running in the background.
  /// resumed - The application is visible and responding to user input.
  /// suspending - The application will be suspended momentarily. Android only
  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }

  @override
  Future<bool> didPopRoute() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: () =>
          GetMaterialApp(
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en'),
            initialRoute: route,
            onGenerateRoute: (settings) =>
                manifest(
                  generateRoutes,
                  settings,
                ),
          ),
    );
  }
}