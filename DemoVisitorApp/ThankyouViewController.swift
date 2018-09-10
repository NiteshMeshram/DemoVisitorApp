//
//  ThankyouViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 17/04/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation

import UIKit

class ThankyouViewController: BaseviewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    
    var initialOrientation = true
    var isInPortrait = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AdjustConstraint()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // change 2 to desired number of seconds
            // Your code with delay
            
            if UserDefaults.standard.hasValue(forKey: "fromThankyouPage") {
                
            }
            else {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "fromThankyouPage")
                defaults.synchronize()
            }
            
            self.navigationController?.popToRootViewController(animated: true)
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        
        //        performSegue(withIdentifier: "chekInChecOutSegue", sender: nil)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        
//        navigationController?.popViewController(animated: true)
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if initialOrientation {
//            initialOrientation = false
//            if view.frame.width > view.frame.height {
//                isInPortrait = false
//                self.topConstraint.constant = 143.00
//            } else {
//                isInPortrait = true
//                self.topConstraint.constant = 00.00
//            }
//        } else {
//            if view.orientationHasChanged(&isInPortrait) {
//
//                if isInPortrait{
//                    self.topConstraint.constant = 143.00
//                }
//                else {
//                    self.topConstraint.constant = 00.00
//                }
//            }
//        }
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.AdjustConstraint()
        
    }
    
    
    func AdjustConstraint() {
        if UIDevice.current.orientation.isPortrait {
            self.topConstraint.constant = 143.00
        }
        else {
            self.topConstraint.constant = 00.00
        }
    }
}
