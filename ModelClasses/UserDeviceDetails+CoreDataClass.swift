//
//  UserDeviceDetails+CoreDataClass.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 02/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON


@objc(UserDeviceDetails)
public class UserDeviceDetails: NSManagedObject {
    
    static func checkDataExistOrNot() -> UserDeviceDetails? {

        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<UserDeviceDetails> = UserDeviceDetails.fetchRequest()
            let uuid: String? = UserDefaults.standard.object(forKey: "userDeviceId") as? String
            fetchRequest.predicate = NSPredicate(format: "deviceUniqueId == %@", uuid!)
            let fetchedResults = try context.fetch(fetchRequest)
            if let deviceInfo = fetchedResults.first {
                return deviceInfo
            }
        }
        catch {
            print ("fetch task failed", error)
        }
        return nil
        
    }

    static func convertJsonToObject(jsonString: JSON) -> UserDeviceDetails? {
        
        if let errorDict = jsonString["error"].dictionary {
            
            if errorDict["hasError"]?.stringValue == VisitorError.success.rawValue {
                
                if let dict = jsonString["response"].dictionary {
                    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
                    if let deviceEntity = NSEntityDescription.insertNewObject(forEntityName: "UserDeviceDetails", into: context) as? UserDeviceDetails {
                        
                        let uuid: String? = UserDefaults.standard.object(forKey: "userDeviceId") as? String
                        deviceEntity.deviceUniqueId = uuid

                        if let topLineText = dict["topline1text"]?.stringValue{
                            deviceEntity.topline1text = topLineText
                        }
                        
                        if let topline2text = dict["topline2text"]?.stringValue{
                            deviceEntity.topline2text = topline2text
                        }
                        
                        if let activation_code = dict["activation_code"]?.stringValue{
                            deviceEntity.activation_code = activation_code
                        }
                        
                        if let activatebtntxt = dict["activatebtntxt"]?.stringValue{
                            deviceEntity.activatebtntxt = activatebtntxt
                        }
                        
                        if let errorCode = errorDict["hasError"]?.stringValue {
                            deviceEntity.hasError = errorCode
                        }
                        
                        do {
                            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
                        } catch let error {
                            print(error)
                        }
                        
                        return deviceEntity
                    }
                    
                }
                
            }
        }
        
        return nil
    }
    
    
    
}
