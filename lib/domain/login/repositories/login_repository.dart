import 'dart:async';

import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';

abstract class LoginRepository{
  FutureOr<AuthEntity?>? login(String? user, String? password);
}