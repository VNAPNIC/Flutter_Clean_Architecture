import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';
import 'package:flutter_architecture/domain/login/use_cases/login_usecases.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase? loginUseCase;

  LoginCubit({this.loginUseCase}) : super(LoginInitial());

  FutureOr<void> login({String? user, String? password}) async {
    try {
      emit(LoadingLoginState());
      final authEntity = await loginUseCase?.login(user, password);
      emit(LoginSuccessfullyState(authEntity: authEntity!));
    } on ApiException catch (e) {
      emit(ErrorLoginState(errorMessage: e.errorMessage ?? ""));
    } catch (_) {
      emit(ErrorLoginState(errorMessage: S.current.connectionProblem));
    }
  }
}