import 'package:flutter/material.dart';

final List<RouteDefine> routes = [];
var _routerIds = <dynamic,String>{};

initRoute(routerIds){
  _routerIds = routerIds;
}

abstract class RouteDefine {
  late List<Path> paths;

  build(Map<String?, WidgetBuilder?>? routeBuilders, RouteSettings settings) {
    paths = initRoute(
        settings.arguments == null ? null : settings.arguments as Map);

    for (var element in paths) {
      if (element.path() != null) routeBuilders?.addAll(element.path()!);
    }
  }

  List<Path> initRoute(Map? arguments);

  RouteDefine() {
    routes.add(this);
  }

  WidgetBuilder widgetProvider(String routerId) =>
      paths.firstWhere((path) => path.name == routerId).builder;
}

class Path {
  String? name;
  WidgetBuilder builder;

  Path({required route, required this.builder}) {
    name = _routerIds[route];
  }

  Map<String, WidgetBuilder>? path() => name == null ? null : {name!: builder};
}

MaterialPageRoute? manifest(Function generateRoute, RouteSettings settings) {
  final Map<String?, WidgetBuilder?>? routeBuilders = <String, WidgetBuilder>{};
  generateRoute();
  for (var route in routes) {
    route.build(routeBuilders, settings);
  }

  final Widget Function(BuildContext context)? routeBuilder =
      routeBuilders?[settings.name ?? ""];

  return CustomMaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name));
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @override
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
    builder: builder,
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
  );
}

