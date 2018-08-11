//
//  DataManager.swift
//  
//
//  Created by Nitesh Meshram on 28/06/18.
//

import Foundation
import SwiftyJSON

enum URI {
    case UserActivation
    
    
    func uriString() -> String {
        switch self {
            //http://dev.visitorbay.com/api/?a=device-info&deviceid=1111111111111
        case .UserActivation: return "" //"http://dev.visitorbay.com/api"
        
        }
    }
}

enum VisitorError: String {
    case fail = "1"
    case success = "0"
}


class DataManager {
    
    //MARK: - Datamanager sharedInstance
    
    class func sharedInstance() -> DataManager {
        struct Static {
            static let sharedInstance = DataManager()
        }
        return Static.sharedInstance
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

}
