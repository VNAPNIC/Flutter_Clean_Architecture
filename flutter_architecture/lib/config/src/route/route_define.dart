part of configuration;

abstract class RouteDefine {
  build(Map<String, WidgetBuilder> routeBuilders, RouteSettings settings){
    initRouter(settings.arguments).forEach((element) {
      routeBuilders.addAll(element.path());
    });
  }
  List<Path> initRouter(Object arguments);
}

class Path {
  String name;
  WidgetBuilder builder;
  Path({this.name, this.builder});

  Map<String, WidgetBuilder> path() => {name: builder};

}