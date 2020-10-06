import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

class TestUtilities {
  /// Initialize localization.
  static Future setupLocalization() async {
    await S.load(const Locale('en'));
  }

  /// Wrap child widget with [MaterialApp] widget and localization.
  static Future createTestableWidget(WidgetTester tester,
      {Widget child}) async {
    await TestUtilities.setupLocalization();

    await tester.pumpWidget(TestWidgetWrapper(child: child));

    await tester.idle();
    // The async delegator load will require build on the next frame.
    await tester.pumpAndSettle();
  }
}

/// Wrapper for wrapping widget in Material App.
/// This will avoid UI exception when running widget.
class TestWidgetWrapper extends StatelessWidget {
  final Widget child;

  const TestWidgetWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: (route) => MaterialPageRoute(
        // Ignore which widget to navigate
        // because we only want to test current widget.
        builder: (_) => Container(),
        settings: RouteSettings(name: route.name),
      ),
      home: child,
    );
  }
}
