import 'package:flutter_architecture/data/setting/models/request/get_setting_request.dart';
import 'package:flutter_architecture/data/setting/repositories/impl/setting_repo.dart';
import 'package:flutter_architecture/data/setting/repositories/setting_repository.dart';
import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_page_usecase_test.mocks.dart';

@GenerateMocks([SettingRepository])
void main() {

  late SettingRepository repo;
  setUp(() {
    repo = MockSettingRepository();
  });

  test('Get setting form use case', () {
    final useCase = HomepageUseCases(repo);

    // dummy data request
    final req =  GetSettingRequest.fromJson(
      {'test': 'Nankai'},
    );

    useCase.getSetting(req);

    verify(repo.getSetting(req))
        .called(1);
  });
}
