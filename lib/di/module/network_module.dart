import 'package:configuration/environment/build_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/remote/api_service.dart';
import '../di.dart';

@module
abstract class NetworkModule {

  @injectable
  ApiService get apiService {
    return ApiService(
      getIt<Dio>(),
      baseUrl: getIt<BuildConfig>().apiUrl,
    );
  }
}
