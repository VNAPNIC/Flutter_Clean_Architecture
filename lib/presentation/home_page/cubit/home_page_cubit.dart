import 'dart:async';

import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/data/setting/models/request/get_setting_request.dart';
import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomepageUseCases homepageUseCases;

  HomePageCubit({
    required this.homepageUseCases,
  }) : super(Initial());

  FutureOr<void> getSetting(String? param) async {
    try {
      final res = await homepageUseCases.getSetting(
        GetSettingRequest.fromJson(
          {'test': param},
        ),
      );
      emit(GetSettingSuccess(res.test ?? ''));
    } on ApiException catch (_) {
      emit(GetSettingError());
    } catch (_) {
      emit(GetSettingError());
    }
  }
}
