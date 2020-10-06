part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginFormEvent extends LoginEvent {
  final String user;
  final String password;

  LoginFormEvent({this.user, this.password});

  @override
  List<Object> get props => [user, password];
}
