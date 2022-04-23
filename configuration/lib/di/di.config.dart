// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../environment/build_config.dart' as _i3;
import '../environment/build_config_beta.dart' as _i4;
import '../environment/build_config_prod.dart' as _i6;
import '../environment/build_config_qc.dart' as _i5;

const String _beta = 'beta';
const String _qc = 'qc';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BuildConfig>(() => _i4.BuildConfigBeta(),
      registerFor: {_beta});
  gh.factory<_i3.BuildConfig>(() => _i5.BuildConfigQc(), registerFor: {_qc});
  gh.factory<_i3.BuildConfig>(() => _i6.BuildConfigProd(),
      registerFor: {_prod});
  return get;
}
