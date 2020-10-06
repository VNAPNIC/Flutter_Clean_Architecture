part of 'login_bloc.dart';

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

class CompletedLoginState extends LoginState {
  final LoginResponse response;

  CompletedLoginState({this.response});

  @override
  List<Object> get props => [response];
}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
