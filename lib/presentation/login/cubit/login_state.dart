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
  final LoginResponse response;

  LoginSuccessfullyState({this.response});

  @override
  List<Object> get props => [response];
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
