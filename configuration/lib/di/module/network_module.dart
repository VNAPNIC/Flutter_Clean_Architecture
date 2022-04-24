import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @injectable
  Dio get dio {
    final Dio dio = Dio();
    // TODO: add interceptor if needed
    return dio;
  }
}
