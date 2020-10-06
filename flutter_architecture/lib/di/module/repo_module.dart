import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/user/repositories/user_repo.dart';
import 'package:flutter_architecture/data/user/source/remote/user_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class RepoModule extends DIModule {
  @override
  provides() async{
  getIt.registerFactory<UserRepoImpl>(
            () => UserRepoImpl(userApi: getIt.get<UserApi>()));
  }
}