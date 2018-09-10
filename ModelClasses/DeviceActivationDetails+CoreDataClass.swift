//
//  DeviceActivationDetails+CoreDataClass.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 09/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON

@objc(DeviceActivationDetails)
public class DeviceActivationDetails: NSManagedObject {

    
    static func checkDataExistOrNot() -> DeviceActivationDetails? {
        
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<DeviceActivationDetails> = DeviceActivationDetails.fetchRequest()
            /*
             let uuid: String? = UserDefaults.standard.object(forKey: "userDeviceId") as? String
             fetchRequest.predicate = NSPredicate(format: "deviceUniqueId == %@", uuid!)
             */
            let fetchedResults = try context.fetch(fetchRequest)
            if let deviceActivation = fetchedResults.first {
                return deviceActivation
            }
        }
        catch {
            print ("fetch task failed", error)
        }
        return nil
        
    }
    
    
    static func convertJsonToObject(jsonString: JSON, userDeviceId: String) -> DeviceActivationDetails? {
        if let errorDict = jsonString["error"].dictionary {
            
            if errorDict["hasError"]?.stringValue == VisitorError.success.rawValue {
                
                if let dict = jsonString["response"].dictionary {
                    
                    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
                    if let activationEntity = NSEntityDescription.insertNewObject(forEntityName: "DeviceActivationDetails", into: context) as? DeviceActivationDetails {
                        
                        activationEntity.deviceUniqueId = userDeviceId
                        
                        if let appui = jsonString["appui"].dictionary {
                            if let fontcolor = appui["fontcolor"]?.stringValue{
                                activationEntity.appuiFontcolor = fontcolor
                            }
                            if let background = appui["background"]?.stringValue{
                                activationEntity.appuiBackground = background
                            }
                            if let checkinbtntxt = appui["checkinbtntxt"]?.stringValue{
                                activationEntity.appuiCheckinbtntxt = checkinbtntxt
                            }
                            if let showcheckoutbtn = appui["showcheckoutbtn"]?.stringValue{
                                activationEntity.appuiShowcheckoutbtn = showcheckoutbtn
                            }
                            if let checkoutbtntxt = appui["checkoutbtntxt"]?.stringValue{
                                activationEntity.appuiCheckoutbtntxt = checkoutbtntxt
                            }
                        }
                        
                        if let welcometxtDict = jsonString["welcometxt"].dictionary {
                            if let welcometxt = welcometxtDict["welcometxt"]?.stringValue{
                                activationEntity.welcometxt = welcometxt
                            }
                            
                        }
                        
                        if let logoDict = jsonString["logo"].dictionary {
                            if let logoDetails = logoDict["logo"]?.stringValue{
                                activationEntity.logoURL = logoDetails
                            }
                            
                        }

                        if let errorCode = errorDict["hasError"]?.stringValue {
                            activationEntity.hasError = errorCode
                        }
                        
                        if let errorStatus = dict["status"]?.stringValue {
                            activationEntity.errorCode = errorStatus
                        }
                        
                        if let errorHeading = dict["errorHeading"]?.stringValue {
                            activationEntity.errorHeading = errorHeading
                        }
                        
                        if let errorMessage = dict["errorMessage"]?.stringValue {
                            activationEntity.errorMessage = errorMessage
                        }
                        
                        do {
                            try context.save()
                        } catch let error {
                            print(error)
                        }
                        
                        return activationEntity
                    }
                }
                
            }
            else {
                let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
                if let activationEntity = NSEntityDescription.insertNewObject(forEntityName: "DeviceActivationDetails", into: context) as? DeviceActivationDetails {
                    
                    activationEntity.deviceUniqueId = userDeviceId
                    
                    if let errorCode = errorDict["hasError"]?.stringValue {
                        activationEntity.hasError = errorCode
                    }
                    if let errorMessage = errorDict["error"]?.stringValue {
                        activationEntity.errorMessage = errorMessage
                    }
                    
                    if let dict = jsonString["response"].dictionary {
                        if let errorStatus = dict["status"]?.stringValue {
                            activationEntity.errorCode = errorStatus
                            
                            if activationEntity.errorCode == "101" {
                                activationEntity.errorHeading = "Device not paired"
                            }
                            
                        }
                    }
                    
                    do {
                        try context.save()
                    } catch let error {
                        print(error)
                    }
                    return activationEntity
                }
            }
        }
        return nil
    }
    
    
}
