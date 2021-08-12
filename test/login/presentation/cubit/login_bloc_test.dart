import 'package:bloc_test/bloc_test.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';
import 'package:flutter_architecture/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../config/config.dart';
import '../../mock.dart';

void main() {
  LoginUserCaseMock mockUseCase;
  LoginCubit loginCubit;

  setUp(() async {
    await TestUtilities.setupLocalization();
  });

  final authEntity = AuthEntity('KbseWdVo87DkmNDO9klriT8SNOkEWRZC');

  blocTest<LoginCubit, LoginState>(
    'Test login bloc yield the right state successfully',
    build: () {
      mockUseCase = LoginUserCaseMock();
      loginCubit = LoginCubit(loginUseCase: mockUseCase);
      when(mockUseCase.login('test', 'test')).thenAnswer((_) async => authEntity);
      return loginCubit;
    },
    act: (cubit) async => await cubit.login(user: 'test', password: 'test'),
    expect: () =>
        [LoadingLoginState(), LoginSuccessfullyState(authEntity: authEntity)],
  );

  blocTest<LoginCubit, LoginState>(
    'Test login bloc with type cast error',
    build: () {
      mockUseCase = LoginUserCaseMock();
      loginCubit = LoginCubit(loginUseCase: mockUseCase);
      when(mockUseCase.login(null, null)).thenAnswer((_) => throw TypeError());
      return loginCubit;
    },
    act: (cubit) async => await cubit.login(user: 'test', password: 'test'),
    expect: () => [
      LoadingLoginState(),
      ErrorLoginState(errorMessage: S.current.connectionProblem)
    ],
  );
}
