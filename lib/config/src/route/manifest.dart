part of configuration;

void generateRouter(Map<String, WidgetBuilder> builders, RouteSettings settings) {
  LoginRouter().build(builders, settings);
  HomeRouter().build(builders, settings);
}

MaterialPageRoute manifest(RouteSettings settings) {
  final routeBuilders = <String, WidgetBuilder>{};
  generateRouter(routeBuilders, settings);
  final Widget Function(BuildContext context) routeBuilder =
      routeBuilders[settings.name];
  return MaterialPageRoute(
      builder: (context) => routeBuilder(context),
      settings: RouteSettings(name: settings.name));
}