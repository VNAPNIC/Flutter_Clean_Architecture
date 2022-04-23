// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_source/remote/apis.dart' as _i6;
import '../data/setting/setting_repo.dart' as _i5;
import '../domain/home_page/use_cases/home_page_usecases.dart' as _i3;
import '../domain/repositories/setting_repository.dart' as _i4;
import '../presentation/home_page/cubit/home_page_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HomepageUseCases>(
      () => _i3.HomepageUseCases(settingRepo: get<_i4.SettingRepository>()));
  gh.factory<_i5.SettingRepoImpl>(
      () => _i5.SettingRepoImpl(api: get<_i6.Apis>()));
  gh.factory<_i7.HomePageCubit>(
      () => _i7.HomePageCubit(homepageUseCases: get<_i3.HomepageUseCases>()));
  return get;
}
