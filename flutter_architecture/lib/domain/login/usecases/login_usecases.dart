import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<LoginResponse> login(String user, String password) =>
      _loginRepository.login(user, password);
}
