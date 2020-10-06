import 'package:flutter_architecture/data/user/model/request/login_request.dart';
import 'package:flutter_architecture/data/user/repositories/user_repo.dart';
import 'package:flutter_architecture/data/user/source/remote/user_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock.dart';

void main() {
  UserApi userApi;
  setUp(() {
    userApi = UserApiMock();
  });

  test(
    'Test if api throw TypeError, function will throw Exception',
        () async {
      when(userApi.login(LoginRequest(user: null, password: null)))
          .thenThrow(TypeError);
      final repository = UserRepoImpl(userApi: userApi);
      expect(
            () => repository.login(null,null),
        throwsA(
          predicate((e) => e is Exception),
        ),
      );
    },
  );
}
