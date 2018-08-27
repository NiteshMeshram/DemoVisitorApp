//
//  DataManager.swift
//  
//
//  Created by Nitesh Meshram on 28/06/18.
//

import Foundation
import SwiftyJSON
import UIKit

enum URI {
    case UserActivation
    
    
    func uriString() -> String {
        switch self {
        //http://dev.visitorbay.com/api/?a=device-info&deviceid=1111111111111
        case .UserActivation: return "" //"http://dev.visitorbay.com/api"
            
        //http://dev.visitorbay.com/api/?a=activate-device&deviceid=<>&acode=<activationcode>
        }
    }
}

enum VisitorError: String {
    case fail = "1"
    case success = "0"
}


class DataManager {
    
    //MARK: - Datamanager sharedInstance
    static var userDeviceId: String = ""
    
    class func sharedInstance() -> DataManager {
        struct Static {
            static let sharedInstance = DataManager()
            //userDeviceId = UIDevice.current.identifierForVendor?.uuidString
        }
        return Static.sharedInstance
    }
    
    func initialize() {
        DataManager.userDeviceId = (UIDevice.current.identifierForVendor?.uuidString)!
    }
    //MARK: - Registration
    class func userActivation(userDetailDict: [String:Any], closure: @escaping(Result<UserActivation,String>) ->Void){
        
        ServerManager.sharedInstance().getRequest(queryStringData: userDetailDict, apiName: .UserActivation, extraHeader: nil) { Result in
            
            switch Result {
            case .success(let jsonResponse):
                var userActivation = UserActivation()
                userActivation = UserActivation.convertJsonToObject(jsonString: jsonResponse)
                closure(.success(userActivation))
                break
            case .failure(let errorMessage):
                closure(.failure(errorMessage))
            }
        }
    }
    
    
    // Activation
    
    class func activationWithKey(userDetailDict: [String:Any], closure: @escaping(Result<UserActivation,String>) ->Void){
        
        ServerManager.sharedInstance().getRequest(queryStringData: userDetailDict, apiName: .UserActivation, extraHeader: nil) { Result in
            
            switch Result {
            case .success(let jsonResponse):
                var userActivation = UserActivation()
                userActivation = UserActivation.convertJsonToObject(jsonString: jsonResponse)
                closure(.success(userActivation))
                break
            case .failure(let errorMessage):
                closure(.failure(errorMessage))
            }
        }
    }
    
}
