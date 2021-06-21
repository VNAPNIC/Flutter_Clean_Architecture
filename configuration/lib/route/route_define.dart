import 'package:flutter/material.dart';

final List<RouteDefine> routes = [];

abstract class RouteDefine {
  build(Map<String?, WidgetBuilder?>? routeBuilders, RouteSettings settings) {
    initRoute(settings.arguments).forEach((element) {
      routeBuilders?.addAll(element.path());
    });
  }

  List<Path> initRoute(Object? arguments);

  RouteDefine() {
    routes.add(this);
  }
}

class Path {
  String name;
  WidgetBuilder builder;

  Path({required this.name, required this.builder});

  Map<String, WidgetBuilder> path() => {name: builder};
}

MaterialPageRoute? manifest(Function generateRoute, RouteSettings settings) {
  final Map<String?, WidgetBuilder?>? routeBuilders = <String, WidgetBuilder>{};
  generateRoute();
  routes.forEach((route) {
    route.build(routeBuilders, settings);
  });

  final Widget Function(BuildContext context)? routeBuilder =
      routeBuilders?[settings.name ?? ""];

  return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name));
}
