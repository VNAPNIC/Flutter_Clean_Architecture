import 'package:configuration/di/di_module.dart';
import 'package:flutter_architecture/domain/home/usecases/home_usecases.dart';
import 'package:flutter_architecture/presentation/home/cubit/home_cubit.dart';

class BlocModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton<HomeCubit>(HomeCubit(homeUseCase: HomeUseCase()));
  }
}
