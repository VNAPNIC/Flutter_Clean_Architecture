import 'package:flutter_architecture/data/user/model/response/login_response.dart';
import 'package:flutter_architecture/generated/l10n.dart';
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

  final response = LoginResponse('KbseWdVo87DkmNDO9klriT8SNOkEWRZC');

  test('Test login bloc yield the right state successfully', () {

    mockUseCase = LoginUserCaseMock();
    loginCubit = LoginCubit(loginUseCase: mockUseCase);

    when(mockUseCase.login('VMO', 'VMO')).thenAnswer((_) async => response);

    expectLater(loginCubit,
        emitsInOrder([LoadingLoginState(), LoginSuccessfullyState(response: response)]));

    loginCubit.login(user: 'VMO', password: 'VMO');
  });

  test('Test login bloc with type cast error', () {
    mockUseCase = LoginUserCaseMock();
    loginCubit = LoginCubit(loginUseCase: mockUseCase);

    when(mockUseCase.login(null, null)).thenAnswer((_) => throw TypeError());

    expectLater(loginCubit, emitsInOrder([
      LoadingLoginState(),
      ErrorLoginState(errorMessage: S.current.connectionProblem),
    ]));

    loginCubit.login(user: null, password: null);
  });
}
