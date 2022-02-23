import 'package:configuration/data/data_source/local/pref/pref_key.dart';
import 'package:configuration/data/common/shared_preferences_manager.dart';
import 'package:configuration/di/di_module.dart';

class SessionPref {
  static void saveSession({required String accessToken}) {
    var preferencesManager = getIt.get<SharedPreferencesManager>();
    preferencesManager.putString(keyAccessToken, accessToken);
  }

  static String? getAccessToken() =>
      getIt.get<SharedPreferencesManager>().getString(keyAccessToken);

  static bool isSessionValid() {
    return getIt
            .get<SharedPreferencesManager>()
            .getString(keyAccessToken)
            ?.isNotEmpty ==
        true;
  }
}
