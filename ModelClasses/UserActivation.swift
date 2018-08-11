//
//  UserActivation.swift
//  DemoApp
//
//  Created by Nitesh Meshram on 28/06/18.
//  Copyright © 2018 Nitesh Meshram. All rights reserved.
//

import Foundation
import SwiftyJSON
class UserActivation : NSObject {
    
    var topline1text = ""
    var topline2text = ""
    var status = ""
    var activation_code = ""
    var activatebtntxt = ""
    var hasError = ""
    //                {
    //                    "response" : {
    //                        "topline1text" : "Enter your 10 digit number",
    //                        "status" : 0,
    //                        "topline2text" : "Activate code below to proceed",
    //                        "activation_code" : "2535146169",
    //                        "activatebtntxt" : "Activate Now !!"
    //                    },
    //                    "error" : {
    //                        "hasError" : 0
    //                    }
    //                }
    
    
    override init() {
        super.init()
    }
    
    static func convertJsonToObject(jsonString: JSON) -> UserActivation {
        
        var userActivation = UserActivation()
        if let dict = jsonString["response"].dictionary {
            if let topLineText = dict["topline1text"]?.stringValue{
                userActivation.topline1text = topLineText
            }
            
            if let status = dict["status"]?.stringValue{
                userActivation.status = status
            }
            
            if let topline2text = dict["topline2text"]?.stringValue{
                userActivation.topline2text = topline2text
            }
            
            if let activation_code = dict["activation_code"]?.stringValue{
                userActivation.activation_code = activation_code
            }
            
            if let activatebtntxt = dict["activatebtntxt"]?.stringValue{
                userActivation.activatebtntxt = activatebtntxt
            }
        }
        
        if let errorDict = jsonString["error"].dictionary {
            
            if let errorCode = errorDict["hasError"]?.stringValue {
                userActivation.hasError = errorCode
            }
        }

        return userActivation
    }
}
