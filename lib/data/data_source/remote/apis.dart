import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'apis.g.dart';

@RestApi()
abstract class Apis {
  factory Apis(Dio dio, {String baseUrl}) = _Apis;
}
