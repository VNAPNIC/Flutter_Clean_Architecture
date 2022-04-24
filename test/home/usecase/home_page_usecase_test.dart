import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_architecture/domain/repositories/setting_repository.dart';
import 'package:flutter_architecture/models/request/get_setting_request.dart';
import 'package:flutter_architecture/models/response/get_setting_response.dart';
import 'package:flutter_architecture/models/setting/setting_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_usecase_test.mocks.dart';

@GenerateMocks([],
    customMocks: [MockSpec<SettingRepository>(returnNullOnMissingStub: true)])
void main() {
  final req = GetSettingRequest('test');
  final res = GetSettingResponse(SettingModel('test'));

  test('test get setting successfully', () async {
    final repo = MockSettingRepository();
    final useCases = HomepageUseCases(settingRepo: repo);

    when(repo.getSetting(req)).thenAnswer((_) => res);
    expect(useCases.getSetting('test'), isA<Future<SettingModel?>>());
  });

  test('test get setting failed', () async {
    final repo = MockSettingRepository();
    final useCases = HomepageUseCases(settingRepo: repo);

    when(repo.getSetting(null)).thenThrow(NullThrownError());
    expect(
      () async => await useCases.getSetting(null),
      throwsA(
        isA<Error>(),
      ),
    );
  });
}
