//
//  ThankyouViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 17/04/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation

import UIKit

class ThankyouViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // change 2 to desired number of seconds
            // Your code with delay
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
    
}
