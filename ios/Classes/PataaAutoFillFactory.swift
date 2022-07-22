//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Vipin Dhangar on 06/05/22.
//

import Foundation
import PataaAutoFillSDK

//import pataa_autofill_view

class PataaAutoFillFactory: NSObject, FlutterPlatformViewFactory {

    var pataaAutoFillView = PataaAutoFillView()
    var pataaDetails: PAPataaDetail?
    static var channel: FlutterMethodChannel?
    
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        if let argumentsDictionary = args as? Dictionary<String, String> {
            return NativeView(frame, viewId:viewId, args:argumentsDictionary)
        }
        
        return NativeView(frame, viewId:viewId, args:args)
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        
        ///
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

public class NativeView : NSObject, FlutterPlatformView, PataaAutoFillDelegate {
    var pataaAutoFillView = PataaAutoFillView()
    
    init(_ frame:CGRect, viewId:Int64, args: Any?){
        let argumentsDictionary = args as? Dictionary<String, String>
        self.pataaAutoFillView = PataaAutoFillView()
        self.pataaAutoFillView.initializeSDK(withKey: argumentsDictionary!["secretKeyiOS"]!, withAppPrefix: argumentsDictionary!["appPrefixiOS"]!)
    }
        
    @objc public func didReceivedPataaDetails(_ pataaDetails: PAPataaDetail?, withError error: Error?) {
        self.pataaAutoFillView.textFieldResignFirstResponder();
        let encoder = JSONEncoder()
        
        if let pataaDetails = pataaDetails, let pataa = pataaDetails.pataa {
            let dict = ["pataaCode": pataa.pataaCode, "address1": pataa.address1, "address2": pataa.address2, "address3": pataa.address3, "address4": pataa.address4, "zipcode": pataa.zipcode, "cityName": pataa.cityName, "stateCode": pataa.stateCode, "stateName": pataa.stateName, "countryCode": pataa.countryCode, "countryName": pataa.countryName, "mapLink": pataa.qrCode, "firstName": pataaDetails.user?.firstName, "lastName": pataaDetails.user?.lastName, "userCountryCode": pataaDetails.user?.countryCode, "mobile": pataaDetails.user?.mobile, "email":pataaDetails.user?.emaiId]
                        
            if let jsonData = try? encoder.encode(dict) {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    PataaAutoFillFactory.channel!.invokeMethod("pataa_autofill_sdk", arguments: jsonString)
                }
            }
        } else {
            if(error!._code == 200 || error!._code == 204) {
                let errorCode = String(error!._code)
                let dict = ["error": error?.localizedDescription, "status": errorCode]
                if let jsonData = try? encoder.encode(dict) {
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        PataaAutoFillFactory.channel!.invokeMethod("pataa_autofill_sdk", arguments: jsonString)
                    }
                }
            }
        }
    }
    
    public func view() -> UIView {
        self.pataaAutoFillView.delegate = self
        self.pataaAutoFillView.awakeFromNib()
        
        return pataaAutoFillView
    }
}
