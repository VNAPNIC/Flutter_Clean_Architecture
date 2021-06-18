import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/home/home_route.dart';
import 'package:flutter_architecture/presentation/login/login_route.dart';

void generateRoute(
    Map<String?, WidgetBuilder?>? builders, RouteSettings settings) {
  LoginRoute().build(builders, settings);
  HomeRoute().build(builders, settings);
}

MaterialPageRoute? manifest(RouteSettings settings) {
  final Map<String?, WidgetBuilder?>? routeBuilders = <String, WidgetBuilder>{};

  generateRoute(routeBuilders, settings);

  final Widget Function(BuildContext context)? routeBuilder =
      routeBuilders?[settings.name ?? ""];

  return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name));
}
