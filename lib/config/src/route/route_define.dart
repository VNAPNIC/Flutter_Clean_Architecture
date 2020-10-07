part of configuration;

abstract class RouteDefine {
  build(Map<String, WidgetBuilder> routeBuilders, RouteSettings settings){
    initRoute(settings.arguments).forEach((element) {
      routeBuilders.addAll(element.path());
    });
  }
  List<Path> initRoute(Object arguments);
}

class Path {
  String name;
  WidgetBuilder builder;
  Path({this.name, this.builder});

  Map<String, WidgetBuilder> path() => {name: builder};

}