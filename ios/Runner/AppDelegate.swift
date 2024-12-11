import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let navController = window!.rootViewController as! UINavigationController
        self.flutterViewController = navController.children.first as! FlutterViewController

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  override func registrar(forPlugin pluginKey: String) -> FlutterPluginRegistrar? {
        flutterViewController.registrar(forPlugin: pluginKey)
    }

    override func hasPlugin(_ pluginKey: String) -> Bool {
        flutterViewController.hasPlugin(pluginKey)
    }

    override func valuePublished(byPlugin pluginKey: String) -> NSObject? {
        flutterViewController.valuePublished(byPlugin: pluginKey)
    }
}
