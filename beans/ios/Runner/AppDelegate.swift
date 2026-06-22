import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      print("AppDelegate launched")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
      print("Flutter Engine Initialized")

      GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
      CommunicatePlugin.register(
          with:
          engineBridge.pluginRegistry
          .registrar(
              forPlugin:
              "CommunicatePlugin"
          )!
      )
  }
}
