part of configuration;

MaterialPageRoute manifest(RouteSettings settings) {
  final routes = <String,WidgetBuilder>{};

  //TODO add routes

  final Widget Function(BuildContext context) routeBuilder = routes[settings.name];
  return MaterialPageRoute(
      builder: (context) => routeBuilder(context),
      settings: RouteSettings(name: settings.name));
}

abstract class RouterDefine<PAGE extends Widget> {
  List<Bundle> initRouter();
}

class Bundle {
  _Widget path(String path) {
    return _Widget(path);
  }
}

/// handle params
class _Widget {
  final String _path;
  WidgetBuilder _builder;

  _Widget(this._path);

  of(WidgetBuilder builder) {
    this._builder = builder;
  }

  Map<String, WidgetBuilder> settings() => {_path: _builder};
}
