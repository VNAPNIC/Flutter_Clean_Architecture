part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessfullyState extends LoginState {
  final AuthEntity authEntity;

  LoginSuccessfullyState({required this.authEntity});

  @override
  List<Object> get props => [authEntity];
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
