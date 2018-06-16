//
//  CompanyViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 18/03/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit

class CompanyViewController: BaseviewController {
    
    var initialOrientation = true
    var isInPortrait = false
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    var comingFrom: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        self.AdjustConstraint()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        
//        performSegue(withIdentifier: "purposeSegue", sender: nil)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
//        _ = navigationController?.popToRootViewController(animated: true)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func checkInButtonClicked(_ sender: Any) {
//        comingFrom = "checkIn"
        performSegue(withIdentifier: "purposeSegue", sender: nil)
    }
    @IBAction func checkOutButtonClicked(_ sender: Any) {
        comingFrom = "checkOut"
        performSegue(withIdentifier: "userSearchSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "purposeSegue"{
            
        }
        if segue.identifier == "userSearchSegue"{
            let theDestination = (segue.destination as! SearchViewController)
            theDestination.comingFrom = comingFrom
        }
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.AdjustConstraint()
    }
    
    func AdjustConstraint() {
        if UIDevice.current.orientation.isPortrait {
            self.topConstraint.constant = 125.00
        }
        else {
            self.topConstraint.constant = 125.00
        }
    }
}
