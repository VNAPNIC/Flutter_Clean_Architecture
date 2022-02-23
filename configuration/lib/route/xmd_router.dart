import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class XMDRouter {
  static pop<T>({T? result}) {
    Get.back(result: result);
  }

  static popAndPushNamed(
    String routeName, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    Get.offAndToNamed(
      routeName,
      arguments: arguments,
      parameters: parameters,
    );
  }

  static pushNamed(
    String routeName, {
    dynamic arguments,
  }) {
    Navigator.pushNamed(
      Get.context!,
      routeName,
      arguments: arguments,
    );
  }

  static pushNamedForResult(
    String routeName, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) async {
    return await Get.toNamed(
      routeName,
      arguments: arguments,
      parameters: parameters,
    );
  }

  static pushNamedAndRemoveUntil(
    String routeName, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    Get.offAllNamed(
      routeName,
      arguments: arguments,
      parameters: parameters,
    );
  }

  static popNamedAndRemoveUntil(String routeName) {
    Get.until((route) => route.settings.name == routeName);
  }
}
