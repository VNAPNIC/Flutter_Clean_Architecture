import 'package:flutter_architecture/data/data_source/remote/apis.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'setting_repository.mocks.dart';

@GenerateMocks([Apis])
void main() {
  Apis? api;
  setUp(() {
    api = MockApis();
  });

  test(
    'Test if api throw TypeError, function will throw Exception',
    () async {
    },
  );
}
