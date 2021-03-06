//
//  BaseviewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 16/06/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit

class BaseviewController: UIViewController {
    
//    @IBOutlet weak var topConstraint: NSLayoutConstraint!
//    var initialOrientation = true
//    var isInPortrait = false
//
    
    func showValidationAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            let appDelegate  = UIApplication.shared.delegate as? AppDelegate
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

extension UIView {
    public func turnOffAutoResizing() {
        self.translatesAutoresizingMaskIntoConstraints = false
        for view in self.subviews as [UIView] {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    public func orientationHasChanged(_ isInPortrait:inout Bool) -> Bool {
        if self.frame.width > self.frame.height {
            if isInPortrait {
                isInPortrait = false
                return true
            }
        } else {
            if !isInPortrait {
                isInPortrait = true
                return true
            }
        }
        return false
    }
}
