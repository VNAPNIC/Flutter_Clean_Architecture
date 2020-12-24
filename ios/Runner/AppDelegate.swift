import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // custom code to allow get flavor
    let controller = self.window.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel.init(name: "flavor", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { (call, result) in
        // Note: this method is invoked on the UI thread
        // Handle battery messages.
        let flavor = Bundle.main.infoDictionary?["Flavor"]
        result(flavor)
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
