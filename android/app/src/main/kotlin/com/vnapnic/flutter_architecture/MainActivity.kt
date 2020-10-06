package com.vnapnic.flutter_architecture

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // custom method to get flavor
        MethodChannel(flutterEngine.dartExecutor, "flavor").setMethodCallHandler { _, result -> result.success(BuildConfig.FLAVOR) }
    }
}
