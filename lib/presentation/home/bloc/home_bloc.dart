import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_architecture/domain/home/usecases/home_usecases.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeUseCase homeUseCase;

  HomeBloc({this.homeUseCase}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
