import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences _sharedPreferences;

  SharedPreferencesManager() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<bool> putString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  String getString(String key) => _sharedPreferences.getString(key);

  Future<bool> putInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  int getInt(String key) => _sharedPreferences.getInt(key);

  Future clear() => _sharedPreferences.clear();
}
