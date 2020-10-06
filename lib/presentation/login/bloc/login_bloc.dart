import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/domain/login/usecases/login_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({this.loginUseCase}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginFormEvent) {
      yield* _mapLoginFormEventToState(event.user, event.password);
    }
  }

  Stream<LoginState> _mapLoginFormEventToState(
      String user, String password) async* {
    try {
      yield LoadingLoginState();
      LoginResponse response = await loginUseCase.login(user, password);
      yield CompletedLoginState(response: response);
    } on ApiException catch (e) {
      yield ErrorLoginState(errorMessage: e.errorMessage);
    } catch (_) {
      yield ErrorLoginState(errorMessage: S.current.connectionProblem);
    }
  }
}
