import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_architecture/models/response/get_setting_response.dart';
import 'package:flutter_architecture/models/setting/setting_model.dart';
import 'package:flutter_architecture/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../config/config.dart';
import 'home_page_bloc_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<HomepageUseCases>(returnNullOnMissingStub: true),
])
void main() {
  final res = GetSettingResponse(SettingModel('test'));

  setUpAll(() async {
    await TestUtilities.setupLocalization();
  });

  blocTest<HomePageCubit, HomePageState>(
    'Test home bloc yield the right state successfully',
    build: () {
      final useCases = MockHomepageUseCases();
      final cubit = HomePageCubit(homepageUseCases: useCases);
      when(useCases.getSetting('test')).thenAnswer((_) async => res.data);
      return cubit;
    },
    act: (cubit) => cubit.getSetting('test'),
    expect: () => [isA<GetSettingSuccess>()],
  );

  blocTest<HomePageCubit, HomePageState>(
    'Test home bloc with type cast error',
    build: () {
      final useCases = MockHomepageUseCases();
      final cubit = HomePageCubit(homepageUseCases: useCases);
      when(useCases.getSetting(null)).thenThrow(NullThrownError());
      return cubit;
    },
    act: (cubit) async => await cubit.getSetting(null),
    expect: () => [isA<GetSettingError>()],
  );
}
