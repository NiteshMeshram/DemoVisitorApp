//
//  UserDeviceDetails+CoreDataClass.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 09/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON

@objc(UserDeviceDetails)
public class UserDeviceDetails: NSManagedObject {

    static func createDeviceEntity() {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        if let deviceEntity = NSEntityDescription.insertNewObject(forEntityName: "UserDeviceDetails", into: context) as? UserDeviceDetails {
            
            //            deviceEntity.deviceUniqueId = UIDevice.current.identifierForVendor?.uuidString
            
            if UserDefaults.standard.hasValue(forKey: "deviceUDID") {
                let defaults = UserDefaults.standard
                let deviceId = defaults.string(forKey: "deviceUDID") //Retrieving the value from user default
                deviceEntity.deviceUniqueId = deviceId
            }
            
            do {
                try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
            } catch let error {
                print(error)
            }
        }
    }
    
    static func checkDeviceId() -> UserDeviceDetails? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<UserDeviceDetails> = UserDeviceDetails.fetchRequest()
            
            if UserDefaults.standard.hasValue(forKey: "deviceUDID") {
                let defaults = UserDefaults.standard
                let deviceId = defaults.string(forKey: "deviceUDID") //Retrieving the value from user default
                fetchRequest.predicate = NSPredicate(format: "deviceUniqueId == %@", deviceId!)
            }
            else {
                let defaults = UserDefaults.standard
                defaults.set(UIDevice.current.identifierForVendor?.uuidString, forKey: "deviceUDID")
                defaults.synchronize()
                
                self.createDeviceEntity()
            }
            let fetchedResults = try context.fetch(fetchRequest)
            if let deviceInfo = fetchedResults.first {
                return deviceInfo
            }
            return nil
        }
        catch {
            print ("fetch task failed", error)
        }
        return nil
        
    }
    
    static func checkDataExistOrNot() -> UserDeviceDetails? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<UserDeviceDetails> = UserDeviceDetails.fetchRequest()
            /*
             let uuid: String? = UserDefaults.standard.object(forKey: "userDeviceId") as? String
             fetchRequest.predicate = NSPredicate(format: "deviceUniqueId == %@", uuid!)
             */
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
    
    static func checkDeviceActivationCode() -> UserDeviceDetails? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<UserDeviceDetails> = UserDeviceDetails.fetchRequest()
            /*
             let uuid: String? = UserDefaults.standard.object(forKey: "userDeviceId") as? String
             fetchRequest.predicate = NSPredicate(format: "deviceUniqueId == %@", uuid!)
             */
            let fetchedResults = try context.fetch(fetchRequest)
            if let deviceInfo = fetchedResults.first {
                if deviceInfo.activation_code != nil {
                    return deviceInfo
                }
                else {
                    return nil
                }
                
            }
        }
        catch {
            print ("fetch task failed", error)
        }
        return nil
        
    }
    
    static func convertJsonToObject(jsonString: JSON, deviceId: String) -> UserDeviceDetails? {
        
        if let userDevice = checkDataExistOrNot() {
            if let errorDict = jsonString["error"].dictionary {
                
                if errorDict["hasError"]?.stringValue == VisitorError.success.rawValue {
                    
                    if let dict = jsonString["response"].dictionary {
                        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
                        if let topLineText = dict["topline1text"]?.stringValue{
                            userDevice.topline1text = topLineText
                        }
                        
                        if let topline2text = dict["topline2text"]?.stringValue{
                            userDevice.topline2text = topline2text
                        }
                        
                        if let activation_code = dict["activation_code"]?.stringValue{
                            userDevice.activation_code = activation_code
                        }
                        
                        if let activatebtntxt = dict["activatebtntxt"]?.stringValue{
                            userDevice.activatebtntxt = activatebtntxt
                        }
                        
                        if let errorCode = errorDict["hasError"]?.stringValue {
                            userDevice.hasError = errorCode
                        }
                        
                        /*
                         
                         errorCode: String?
                         errorMessage: String?
                         errorHeading: String?
                         
                         */
                        
                        if let errorStatus = dict["status"]?.stringValue {
                            userDevice.errorCode = errorStatus
                        }
                        
                        if let errorHeading = dict["errorHeading"]?.stringValue {
                            userDevice.errorHeading = errorHeading
                        }
                        
                        if let errorMessage = dict["errorMessage"]?.stringValue {
                            userDevice.errorMessage = errorMessage
                        }
                        
                        do {
                            try context.save()
                        } catch let error {
                            print(error)
                        }
                        
                        return userDevice
                        
                    }
                    
                }
                else {
                    print("Error Data ")
                   
                    if let dict = jsonString["response"].dictionary {
                        
                        if let errorCode = errorDict["hasError"]?.stringValue {
                            userDevice.hasError = errorCode
                        }
                        
                        if let errorStatus = dict["status"]?.stringValue {
                            userDevice.errorCode = errorStatus
                        }
                        
                        if let errorHeading = dict["errorHeading"]?.stringValue {
                            userDevice.errorHeading = errorHeading
                        }
                        
                        if let errorMessage = dict["errDesc"]?.stringValue {
                            userDevice.errorMessage = errorMessage
                        }
                        
                        return userDevice
                    }
                    
                    
                   
                }
            }
            
        }
        return nil
    }
    
    
}
