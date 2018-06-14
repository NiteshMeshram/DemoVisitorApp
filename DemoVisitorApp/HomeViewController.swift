//
//  HomeViewController.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 3/5/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
//        performSegue(withIdentifier: "chekInChecOutSegue", sender: nil)
    }
    
    @IBAction func activateNowClicked(_ sender: Any) {
//        performSegue(withIdentifier: "chekInChecOutSegue", sender: nil)
        
        self.performSegue(withIdentifier: "mainFlowSegue", sender: nil)
    }
    
    override public var traitCollection: UITraitCollection {
        
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isPortrait {
            
            return UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: .compact),
                                                  UITraitCollection(verticalSizeClass: .regular)])
            
        }
        return super.traitCollection
    }
    
}

//public class CustomTraitCollectionViewController: UIViewController {
//
//    override public var traitCollection: UITraitCollection {
//
//        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isPortrait {
//
//            return UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: .compact),
//                                           UITraitCollection(verticalSizeClass: .regular)])
//
//        }
//        return super.traitCollection
//    }
//}

