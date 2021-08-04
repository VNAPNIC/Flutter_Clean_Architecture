import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/domain/login/usecases/login_usecases.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase? loginUseCase;

  LoginCubit({this.loginUseCase}) : super(LoginInitial());

  FutureOr<void> login({String? user, String? password}) async {
    try {
      emit(LoadingLoginState());
      LoginResponse? response = await loginUseCase?.login(user, password);
      emit(LoginSuccessfullyState(response: response!));
    } on ApiException catch (e) {
      emit(ErrorLoginState(errorMessage: e.errorMessage ?? ""));
    } catch (_) {
      emit(ErrorLoginState(errorMessage: S.current.connectionProblem));
    }
  }
}
