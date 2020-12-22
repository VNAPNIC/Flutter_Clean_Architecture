import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_architecture/presentation/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRoute extends RouteDefine {
  static const id = 'home';

  @override
  List<Path> initRoute(Object arguments) => [
        Path(
            name: id,
            builder: (_) => BlocProvider(
                create: (_) => getIt<HomeCubit>(),
                child: HomeScreen(arguments))),
      ];
}
