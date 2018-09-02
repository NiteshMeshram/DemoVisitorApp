//
//  UserDevicePairingDetails.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 01/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation

import Foundation
import SwiftyJSON
class UserDevicePairingDetails: NSObject {
    var responseStatus = ""
    var responseApikey = ""
    var welcometxt = ""
    var logoURL = ""
    var isAgreement: Bool = false
    var isRepeated: Bool = false
    var isVisitorphoto: Bool = false
    var checkoutmessage = ""
    var appuiBackground = ""
    var appuiFontcolor = ""
    var appuiCheckinbtntxt = ""
    var appuiCheckoutbtntxt = ""
    var appuiShowcheckoutbtn = ""
    var hasError: Bool = false
    
    override init() {
        super.init()
    }
    
    static func convertJsonToObject(jsonString: JSON) -> UserDevicePairingDetails {
        
        var userDeviceDetails = UserDevicePairingDetails()
        
        if let dict = jsonString["response"].dictionary {
            
            if let status = dict["status"]?.stringValue{
                userDeviceDetails.responseStatus = status
                
                if status == VisitorError.resposeCode.rawValue {
                
//                    self.saveJSON(j: jsonString)
//                    jsonString.saveJSON(j: <#T##JSON#>)
//                    jsonString.saveJSON()
                }
            }
        }
        
//        if jsonString["agreement"]["isagreement"].stringValue != nil {
//
//        }
        if let appui = jsonString["appui"].dictionary {
            if let fontcolor = appui["fontcolor"]?.stringValue{
                userDeviceDetails.appuiFontcolor = fontcolor
            }
            if let background = appui["background"]?.stringValue{
                userDeviceDetails.appuiBackground = background
            }
            if let checkinbtntxt = appui["checkinbtntxt"]?.stringValue{
                userDeviceDetails.appuiCheckinbtntxt = checkinbtntxt
            }
            if let showcheckoutbtn = appui["showcheckoutbtn"]?.stringValue{
                userDeviceDetails.appuiShowcheckoutbtn = showcheckoutbtn
            }
            if let checkoutbtntxt = appui["checkoutbtntxt"]?.stringValue{
                userDeviceDetails.appuiCheckoutbtntxt = checkoutbtntxt
            }
        }
        
        if let welcometxtDict = jsonString["welcometxt"].dictionary {
//            if let showwelcome = welcometxtDict["showwelcome"]?.stringValue{
//                userDeviceDetails. = showwelcome
//            }
            if let welcometxt = welcometxtDict["welcometxt"]?.stringValue{
                userDeviceDetails.welcometxt = welcometxt
            }
            
        }
        
        
        if let logoDict = jsonString["logo"].dictionary {
            if let logoDetails = logoDict["logo"]?.stringValue{
                userDeviceDetails.logoURL = logoDetails
            }
            
        }
        if let errorDict = jsonString["error"].dictionary {
            if let errorCode = errorDict["hasError"]?.stringValue {
                if errorCode == "0" {
                    userDeviceDetails.hasError = false
                }
                else {
                    userDeviceDetails.hasError = true
                }
                
            }
        }
        
        return userDeviceDetails
    }
    /*
    static func saveJSON(j: JSON) {
        let defaults = UserDefaults.standard
        defaults.setValue(j.rawString()!, forKey: "json")
        // here I save my JSON as a string
    }
    static func loadJSON() -> JSON {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: "json") as! JSON
    }
    */
    
    func loadJSON() -> JSON {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: "json") as! JSON
    }
}

extension JSON {
    func saveJSON() {
        let defaults = UserDefaults.standard
        defaults.setValue(self.rawString(), forKey: "json")
        // here I save my JSON as a string
    }
//    func loadJSON() -> JSON {
//        let defaults = UserDefaults.standard
//        return defaults.value(forKey: "json") as! JSON
//    }
}
