import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/generated/l10n.dart';
import 'package:flutter_architecture/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/config.dart';
import '../../mock.dart';

void main() {
  setUp(() async {
    await TestUtilities.setupLocalization();
  });

  test('Test login bloc yield the right state completed', () {
    final mockUseCase = LoginUserCaseMock();
    final loginBloc = LoginBloc(loginUseCase: mockUseCase);
    final response = LoginResponse('KbseWdVo87DkmNDO9klriT8SNOkEWRZC');

    when(mockUseCase.login('VMO', 'VMO')).thenAnswer((_) async => response);

    expectLater(
        loginBloc, emitsInOrder([LoadingLoginState(), CompletedLoginState()]));

    loginBloc.add(LoginFormEvent());
  });

  test('Test login bloc with type cast error', () {
    final mockUseCase = LoginUserCaseMock();
    final loginBloc = LoginBloc(loginUseCase: mockUseCase);

    when(mockUseCase.login(null, null)).thenAnswer((_) => throw TypeError());

    final expectedState = [
      LoadingLoginState(),
      ErrorLoginState(
          errorMessage:
          S.current.connectionProblem),
    ];

    expectLater(loginBloc, emitsInOrder(expectedState));

    loginBloc.add(LoginFormEvent());
  });
}
