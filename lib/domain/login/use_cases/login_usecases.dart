import 'dart:async';

import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  FutureOr<AuthEntity?>? login(String? user, String? password) =>
      _loginRepository.login(user, password);
}
