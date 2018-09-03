//
//  DeviceActivationDetails+CoreDataClass.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 02/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON


@objc(DeviceActivationDetails)
public class DeviceActivationDetails: NSManagedObject {
    
    
    static func convertJsonToObject(jsonString: JSON) -> DeviceActivationDetails? {
        if let errorDict = jsonString["error"].dictionary {
            
            if errorDict["hasError"]?.stringValue == VisitorError.success.rawValue {
                
                if let dict = jsonString["response"].dictionary {
                    
                    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
                    if let activationEntity = NSEntityDescription.insertNewObject(forEntityName: "DeviceActivationDetails", into: context) as? DeviceActivationDetails {
                        
                        
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
                        
                        
                        return activationEntity
                    }
                }
                
            }
        }
        return nil
    }
    
}
