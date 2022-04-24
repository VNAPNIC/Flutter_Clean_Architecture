import UIKit
import Flutter
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var methodChannel: FlutterMethodChannel? = nil
    
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let batteryChannel = FlutterMethodChannel(name: "com.exchange.dev/native",
                                                binaryMessenger: controller.binaryMessenger)
      //val notify
      var notifObservers = [NSObjectProtocol]()
      var isFirstOpenDialog = true;
      
      batteryChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          // Note: this method is invoked on the UI thread.
          if call.method == "StartNativeIOS" {
              
              let observer = NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
                  var topWindow: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
                  topWindow?.rootViewController = UIViewController()
                  topWindow?.windowLevel = UIWindow.Level.alert + 1
                  
                      if(isFirstOpenDialog == true){
                          isFirstOpenDialog = false
                          let alert = UIAlertController(title: "Security risk", message: "Your screenshots (or screen videos) \n migh containt sensitive information that could harm your wallet. Please use at your own risk!", preferredStyle: .alert)
                          alert.addAction(UIAlertAction(title: "I understand!", style: .cancel) { _ in
                              isFirstOpenDialog = true

                              // important to hide the window after work completed.
                              // this also keeps a reference to the window until the action is invoked.
                              topWindow?.isHidden = true // if you want to hide the topwindow then use this
                              topWindow = nil // if you want to hide the topwindow then use this
                           })

                          topWindow?.makeKeyAndVisible()
                          topWindow?.rootViewController?.present(alert, animated: true, completion: nil)
                      }
              }
              notifObservers.append(observer)

              result(nil)

          } else if(call.method == "CloseNotify"){
              for observer in notifObservers {
                  NotificationCenter.default.removeObserver(observer)
              }
              notifObservers.removeAll()
          }
          else {
              result(FlutterMethodNotImplemented)
              return
            }
//        self?.receiveBatteryLevel(result: result)
//          self.applicationWillResignActive
//          self?.deleteAllPhotos(result: result)
      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

