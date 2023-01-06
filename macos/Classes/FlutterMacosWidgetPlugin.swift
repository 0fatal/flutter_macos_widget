import Cocoa
import FlutterMacOS
import WidgetKit

public class FlutterMacosWidgetPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_macos_widget", binaryMessenger: registrar.messenger)
    let instance = FlutterMacosWidgetPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "reloadAllTimelines":
      if #available(macOS 11.0, *) {
        WidgetCenter.shared.reloadAllTimelines()
      }
    case "reloadTimelines":
      if #available(macOS 11.0, *) {
        if let args = call.arguments as? [String: Any],
           let ofKind = args["ofKind"] as? String
        {
          WidgetCenter.shared.reloadTimelines(ofKind: ofKind)
        }
      }
    case "getItem":
      if let args = call.arguments as? [String: Any],
         let appGroup = args["appGroup"] as? String,
         let key = args["key"] as? String
      {
        guard !appGroup.isEmpty else { return }
        guard let sharedDefaults = UserDefaults(suiteName: appGroup) else {
          result(nil)
          return
        }

        let value = sharedDefaults.value(forKey: key)
        result(value)
        return
      }
    case "setItem":
      if let args = call.arguments as? [String: Any],
         let appGroup = args["appGroup"] as? String,
         let key = args["key"] as? String, let value = args["value"] as? Any
      {
        guard !appGroup.isEmpty else { return }
        guard let sharedDefaults = UserDefaults(suiteName: appGroup) else {
          result(nil)
          return
        }

        sharedDefaults.setValue(value, forKey: key)
        result(value)
        return
      }
    case "removeItem":
      if let args = call.arguments as? [String: Any],
         let appGroup = args["appGroup"] as? String,
         let key = args["key"] as? String
      {
        guard !appGroup.isEmpty else { return }
        guard let sharedDefaults = UserDefaults(suiteName: appGroup) else {
          result(nil)
          return
        }

        sharedDefaults.removeObject(forKey: key)
        result(true)
        return
      }
    default:
      result(FlutterMethodNotImplemented)
      return
    }
    result(nil)
  }
}
