import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'stf_api.g.dart';

@RestApi()
abstract class StfApi {
  factory StfApi(Dio dio, {String baseUrl}) = _StfApi;
}