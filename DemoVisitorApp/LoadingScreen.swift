
//
//  LoadingScreen.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 05/09/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit

class LoadingScreen: BaseviewController {
    @IBOutlet weak var loadImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //self.view.translatesAutoresizingMaskIntoConstraints = false
        self.loadImageView.translatesAutoresizingMaskIntoConstraints = false
        
        var loginDict = [String: Any]()
        if let deviceInfo = UserDeviceDetails.checkDeviceId() {
            loginDict = ["a":"device-info" ,"deviceid":deviceInfo.deviceUniqueId!]
            //
//            loginDict = ["a":"device-info" ,"deviceid":"0B4B6F5C-D6A7-47EC-AFE3-AE209CA755F0"]
        }
        
        print(loginDict)
        
        // activationScreenSegue   signInOutScreenSegue
        DataManager.userActivation(userDetailDict: loginDict, closure: {Result in
            
            switch Result {
            case .success(let userActivation):
                
                if UserDefaults.standard.hasValue(forKey: "loggedInUser") {
                    print("loggedInUser") //signInOutScreen
                    self.performSegue(withIdentifier: "signInOutScreenSegue", sender: nil)
                    
                }else if userActivation.hasError == VisitorError.success.rawValue{
                    // activationView
                    self.performSegue(withIdentifier: "activationScreenSegue", sender: userActivation)
                    
                }
                else {
                    //                    errorScreen ==> errorScreenSegue
                    
                    if userActivation.errorCode == "203"   {
                        self.performSegue(withIdentifier: "errorScreenSegue", sender: userActivation)
                        
                    }else {
                        
                        self.showValidationAlert(title: userActivation.errorHeading!, message: userActivation.errorMessage!)
                    }
                }
                break
            case .failure(let errorMessage):
                print(errorMessage) //errorScreen
                
                self.performSegue(withIdentifier: "errorScreenSegue", sender: nil)
                
            }
        })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: {
            _ in
            
            if UIDevice.current.orientation.isLandscape {
                print("Landscape")//splash_v
                self.loadImageView.image =  #imageLiteral(resourceName: "splash_h")
                
            } else {
                print("Portrait")
                self.loadImageView.image = #imageLiteral(resourceName: "splash_v")
                
            }
        })
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activationScreenSegue" {
            var homeViewController = segue.destination as! HomeViewController
            let deviceDetails = sender as!  UserDeviceDetails
            homeViewController.userActivation = deviceDetails
            //            vc.data = "Data you want to pass"
            //Data has to be a variable name in your RandomViewController
        }
        if segue.identifier == "errorScreenSegue" {
            var errorViewController = segue.destination as! ErrorViewController
            let deviceDetails = sender as!  UserDeviceDetails
            errorViewController.errorMessgeText = deviceDetails.errorMessage
            
        }
    }
    
    
    
    
}
