//
//  AppDelegate.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 3/5/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userDeviceId: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Get the reference to the Managed Object Context
        // from the persistent coordinator.
//        let context = self.persistentContainer.viewContext
        
        self.databasePath()
        var loginDict = [String: Any]()
        let userDefaults = UserDefaults.standard
        if let key = userDefaults.object(forKey: "userDeviceId"){
            // exist
            if let uuid = userDefaults.string(forKey: key as! String){
                self.userDeviceId = uuid
            }
        }
        else {
            // not exist
            self.userDeviceId = UIDevice.current.identifierForVendor?.uuidString
            userDefaults.set(self.userDeviceId, forKey: "userDeviceId") //setObject
            userDefaults.synchronize()
        }
        
        loginDict = ["a":"device-info" ,"deviceid":self.userDeviceId]
//        loginDict = ["a":"device-info" ,"deviceid":"8485485845845eerer434343"]
        
//        ?a=activate-device&deviceid=<>&acode=<activationcode>

        print(loginDict)
        
        if let deviceInfo = UserDeviceDetails.checkDataExistOrNot() {
//            print("Data Exist \(deviceInfo)")
            
            if deviceInfo.hasError == VisitorError.success.rawValue{
                self.window = UIWindow(frame: UIScreen.main.bounds)
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "activationView") as! HomeViewController
                initialViewController.userActivation = deviceInfo
                self.window?.rootViewController = initialViewController
                self.window?.makeKeyAndVisible()
            }
        }
        else {
            DataManager.userActivation(userDetailDict: loginDict, closure: {Result in
                
                switch Result {
                case .success(let userActivation):
                    
                    if userActivation.hasError == VisitorError.success.rawValue{
                        self.window = UIWindow(frame: UIScreen.main.bounds)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let initialViewController = storyboard.instantiateViewController(withIdentifier: "activationView") as! HomeViewController
                        initialViewController.userActivation = userActivation
                        self.window?.rootViewController = initialViewController
                        self.window?.makeKeyAndVisible()
                    }
                    else {
                        //                    errorScreen
                        self.window = UIWindow(frame: UIScreen.main.bounds)
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let initialViewController = storyboard.instantiateViewController(withIdentifier: "errorScreen") as! ErrorViewController
                        
                        
                        self.window?.rootViewController = initialViewController
                        self.window?.makeKeyAndVisible()
                    }
                    break
                case .failure(let errorMessage):
                    print(errorMessage)
                    self.window = UIWindow(frame: UIScreen.main.bounds)
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let initialViewController = storyboard.instantiateViewController(withIdentifier: "errorScreen") as! ErrorViewController
                    
                    
                    self.window?.rootViewController = initialViewController
                    self.window?.makeKeyAndVisible()
                    break
                }
            })
        }
        
        
        
        
        
        
        
         IQKeyboardManager.sharedManager().enable = true
        
        CoreDataStack.sharedInstance.applicationDocumentsDirectory()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        CoreDataStack.sharedInstance.saveContext()
    }
    func databasePath() {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print(urls[urls.count-1] as URL)
        
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        print("\(path)")

    }

}

class Switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC : UIViewController?
        
        print(status)
        
        
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "checkOutFlow") as! CompanyViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "activationView") as! HomeViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
    
}

