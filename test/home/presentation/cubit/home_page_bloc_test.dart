import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_architecture/data/setting/models/request/get_setting_request.dart';
import 'package:flutter_architecture/data/setting/models/response/get_setting_response.dart';
import 'package:flutter_architecture/domain/home_page/use_cases/home_page_usecases.dart';
import 'package:flutter_architecture/presentation/home_page/cubit/home_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../config/config.dart';
import 'home_page_bloc_test.mocks.dart';

@GenerateMocks([HomepageUseCases])
void main() {

  late HomepageUseCases useCases;
  setUp(() {
    useCases = MockHomepageUseCases();
  });


  // dummy data request
  final req =  GetSettingRequest.fromJson(
    {'test': 'Nankai'},
  );
  // dummy data response
  final res = GetSettingResponse.fromJson({'test': 'Response: ${req.test}'});

  setUp(() async {
    await TestUtilities.setupLocalization();
  });

  blocTest<HomePageCubit, HomePageState>(
    'Test home bloc yield the right state successfully',
    build: () {
      final  homePageCubit = HomePageCubit(homepageUseCases: useCases);
      when(useCases.getSetting(req)).thenAnswer((_) async => res);
      return homePageCubit;
    },
    act: (cubit) async => await cubit.getSetting('Nankai'),
    expect: () => [GetSettingSuccess(res.test ?? '')],
  );

  blocTest<HomePageCubit, HomePageState>(
    'Test home bloc with type cast error',
    build: () {
      final homePageCubit = HomePageCubit(homepageUseCases: useCases);
      when(useCases.getSetting(null)).thenAnswer((_) => throw TypeError());
      return homePageCubit;
    },
    act: (cubit) async => await cubit.getSetting(null),
    expect: () => [GetSettingError()
    ],
  );
}
