import Flutter
import UIKit
import PataaAutoFillSDK

public class SwiftPataaAutofillSdkPlugin: NSObject, FlutterPlugin {
    
    static var channel: FlutterMethodChannel?
      
    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "pataa_autofill_sdk", binaryMessenger: registrar.messenger())
        let instance = SwiftPataaAutofillSdkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel!)
        
        let factory = PataaAutoFillFactory()
        PataaAutoFillFactory.channel = self.channel
        registrar.register(factory, withId: "NativeView")
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
