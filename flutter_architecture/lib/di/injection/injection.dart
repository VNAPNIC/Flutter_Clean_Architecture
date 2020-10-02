import 'package:flutter_architecture/di/module/bloc_module.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static Future inject() async {
    await BlocModule().provides();
  }
}
