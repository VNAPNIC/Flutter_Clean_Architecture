import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/home/usecases/home_usecases.dart';
import 'package:flutter_architecture/presentation/home/bloc/home_bloc.dart';

class BlocModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton<HomeBloc>(HomeBloc(homeUseCase: HomeUseCase()));
  }
}
