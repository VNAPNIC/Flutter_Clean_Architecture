import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/auth_interceptor.dart';
import 'package:configuration/network/interceptor/data_format_interceptor.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/data_source/remote/apis.dart';
import 'package:flutter_architecture/data/data_source/remote/stf_api.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    // register api
    final dioMain = await setupMain();
    getIt.registerSingleton(Apis(dioMain, baseUrl: dioMain.options.baseUrl));
    final dioStf = await setupStf();
    getIt.registerSingleton(StfApi(dioStf, baseUrl: dioStf.options.baseUrl));

    // Only for download
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().stfConnectTimeout,
      receiveTimeout: BuildConfig.get().stfReceiveTimeout,
      sendTimeout: BuildConfig.get().stfReceiveTimeout,
    );
    final dio = Dio(options);
    getIt.registerSingleton(dio);
  }

  static FutureOr<Dio> setupMain() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().connectTimeout,
      receiveTimeout: BuildConfig.get().receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get().baseUrl,
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    // dio.interceptors.add(RetryInterceptor(dio));

    dio.interceptors.add(DataFormatInterceptor());

    /// Print Log (production mode removal)
    // if (BuildConfig.get().flavor != Flavor.PRODUCTION) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    // }
    return dio;
  }

  static FutureOr<Dio> setupStf() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get().stfConnectTimeout,
      receiveTimeout: BuildConfig.get().stfReceiveTimeout,
      sendTimeout: BuildConfig.get().stfReceiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get().baseUrl,
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(DataFormatInterceptor());

    /// Print Log (production mode removal)
    // if (BuildConfig.get().flavor != Flavor.PRODUCTION) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
    // }
    return dio;
  }
}
