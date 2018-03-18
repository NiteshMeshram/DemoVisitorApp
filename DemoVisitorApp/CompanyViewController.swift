//
//  CompanyViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 18/03/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit

class CompanyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        
        performSegue(withIdentifier: "purposeSegue", sender: nil)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
//        _ = navigationController?.popToRootViewController(animated: true)
        navigationController?.popViewController(animated: true)
    }
}
