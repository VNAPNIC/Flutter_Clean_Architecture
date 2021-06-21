import 'package:configuration/di/di_module.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_architecture/presentation/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRoute extends RouteDefine {
  static const id = 'home';

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>(),
            child: HomeScreen(
                response:
                    arguments == null ? null : arguments as LoginResponse),
          ),
        ),
      ];
}
