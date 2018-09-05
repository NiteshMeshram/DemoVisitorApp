//
//  DeviceActivationDetails+CoreDataClass.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 04/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON


@objc(DeviceActivationDetails)
public class DeviceActivationDetails: NSManagedObject {

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
                        
                        do {
                            try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
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
                    
                    do {
                        try CoreDataStack.sharedInstance.persistentContainer.viewContext.save()
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
