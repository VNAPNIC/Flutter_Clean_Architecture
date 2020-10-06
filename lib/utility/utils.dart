import 'package:flutter/material.dart';

class Utils{
  static void afterBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}