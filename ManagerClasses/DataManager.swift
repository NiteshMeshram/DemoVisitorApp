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
//                print(jsonResponse)
                
//                let sharedInstance = SharedManager.sharedInstance
                
                var userActivation = UserActivation()
               
                UserActivation.convertJsonToObject(jsonString: jsonResponse)
                
                
//                if jsonResponse["error"]["hasError"].stringValue == "0" {
////                     print(jsonResponse["error"]["hasError"])
//
//                    if jsonResponse["response"]["status"].stringValue == "0" {
//                        print(jsonResponse["error"]["hasError"])
//                    }
//                }
                
               
                


                break
            case .failure(let errorMessage):
                closure(.failure(errorMessage))
            }
        }
    }

}
