//
//  HomeViewController.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 3/5/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import UIKit

class HomeViewController: BaseviewController {

    var initialOrientation = true
    var isInPortrait = false
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.AdjustConstraint()
        
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController!.viewControllers.removeAll()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonClick(_ sender: Any) {
        
    }
    
    @IBAction func activateNowClicked(_ sender: Any) {

        self.performSegue(withIdentifier: "mainFlowSegue", sender: nil)
    }
    

    override func viewWillLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        

        self.AdjustConstraint()
        
    }
    
    func AdjustConstraint() {
        if UIDevice.current.orientation.isPortrait {
            self.topConstraint.constant = 355.00
        }
        else {
            self.topConstraint.constant = 150.00
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("landscape")
        } else {
            print("portrait")
        }
    }
    

    
}