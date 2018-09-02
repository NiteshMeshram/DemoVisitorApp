//
//  UserDeviceDetails+CoreDataProperties.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 02/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//
//

import Foundation
import CoreData


extension UserDeviceDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDeviceDetails> {
        return NSFetchRequest<UserDeviceDetails>(entityName: "UserDeviceDetails")
    }

    @NSManaged public var activatebtntxt: String?
    @NSManaged public var activation_code: String?
    @NSManaged public var deviceUniqueId: String?
    @NSManaged public var topline1text: String?
    @NSManaged public var topline2text: String?

}
