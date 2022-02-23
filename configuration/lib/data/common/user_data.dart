import 'package:configuration/utility/constants.dart';
import 'dart:async';
import 'package:flutter_keychain/flutter_keychain.dart';

class UserData {
  static void saveUser(String? phoneNumb, String? pwd) async {
    await FlutterKeychain.put(key: "phone_number", value: phoneNumb ?? "");
    await FlutterKeychain.put(key: "password", value: pwd ?? "");
  }
  static Future<String?> getPhoneNumber() async {
    final String? phone = await FlutterKeychain.get(key: KEYCHAIN_PHONE_NUMBER);
    return phone;
  }
  static Future<String?> getPwd() async {
    final String? pwd = await FlutterKeychain.get(key: KEYCHAIN_PASSWORD);
    return pwd;
  }

}

