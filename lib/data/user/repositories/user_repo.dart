import 'dart:async';

import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:flutter_architecture/data/user/data_source/remote/user_api.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';
import 'package:flutter_architecture/domain/login/repositories/login_repository.dart';
import 'package:dio/dio.dart';

class UserRepoImpl implements LoginRepository {
  UserApi? userApi;

  UserRepoImpl({this.userApi});

  @override
  FutureOr<AuthEntity?>? login(String? user, String? password) async {
    try {
      assert(user != null && password != null);
      return AuthEntity('APA91bGSAUqIOaXTEK8ga7GKUM85eEK9sQMvWcxcCFqlewDvnuib0RFW');
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
