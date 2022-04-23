import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_architecture/data/setting/setting_repo.dart';
import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_architecture/manifest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import 'cubit/home_page_cubit.dart';
import 'ui/home_page_screen.dart';

class HomePageRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: HomePageRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<HomePageCubit>(
                create: (_) => HomePageCubit(
                  homepageUseCases: HomepageUseCases(
                    settingRepo: SettingRepoImpl(),
                  ),
                ),
              ),
            ],
            child: HomePageScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[HomePageRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[HomePageRoute]!);
  }
}
