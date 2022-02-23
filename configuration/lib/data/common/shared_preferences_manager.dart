import 'package:configuration/data/data_source/local/pref/pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferences? sharedPreferences;

  SharedPreferencesManager(this.sharedPreferences);

  Future<bool?>? putString(String key, String value) =>
      sharedPreferences?.setString(key, value);

  String? getString(String key) => sharedPreferences?.getString(key);

  Future<bool?>? putInt(String key, int value) =>
      sharedPreferences?.setInt(key, value);

  Future<bool?>? putBool(String key, bool value) =>
      sharedPreferences?.setBool(key, value);

  bool? getBool(String key) => sharedPreferences?.getBool(key);

  int? getInt(String key) => sharedPreferences?.getInt(key);

  Future? clear() {
    sharedPreferences?.remove(keyAccessToken);
  }
}
