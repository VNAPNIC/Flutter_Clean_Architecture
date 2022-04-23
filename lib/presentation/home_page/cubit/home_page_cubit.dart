import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_page_state.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final HomepageUseCases homepageUseCases;

  HomePageCubit({
    required this.homepageUseCases,
  }) : super(Initial());

  FutureOr<void> getSetting(String? param) async {
    try {
      final res = await homepageUseCases.getSetting(param);
      emit(GetSettingSuccess(res?.test ?? ''));
    } catch (e) {
      emit(GetSettingError());
    }
  }
}