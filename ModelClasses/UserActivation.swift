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
            print(dict)
        }
//    7432
        
//        userActivation.topline1text
//        userActivation.status
//        userActivation.topline2text
//        userActivation.activation_code
//        userActivation.activatebtntxt
//
//        userActivation.hasError
        
//        for i in 0..<jsonString["resultArray"].count {
//
//            if let dict = jsonString["resultArray"][i].dictionary {
//
//                let bannerModel = Banner()
//
//                if let bannerID = dict["id"]?.stringValue{
//                    bannerModel.offerBannerID = bannerID
//                }
//                if let bannerImagePath = dict["offer_banner_image_path"]?.stringValue{
//                    bannerModel.offerBannerImagePath = bannerImagePath
//                }
//                bannerArrayModel.append(bannerModel)
//            }
//        }
        return userActivation
    }
}
