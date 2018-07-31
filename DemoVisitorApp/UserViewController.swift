//
//  UserViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 18/03/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation


import UIKit

class UserViewController: BaseviewController, UITextFieldDelegate {
    
    @IBOutlet weak var personToMeetTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var initialOrientation = true
    var isInPortrait = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.AdjustConstraint()
        
        let placeHolderColor = UIColor(red: 138.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1.0)
        
        
        personToMeetTextField.setBottomLine(borderColor: UIColor.gray)
        personToMeetTextField.attributedPlaceholder = NSAttributedString(string: "Person You Are Here To Meet",
                                                               attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        
        
//        companyTextField.setBottomLine()
        companyTextField.setBottomLine(borderColor: UIColor.gray)
        companyTextField.attributedPlaceholder = NSAttributedString(string: "Your Company",
                                                                         attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
//        emailTextField.setBottomLine()
        emailTextField.setBottomLine(borderColor: UIColor.gray)
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Your Email",
                                                                    attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        
//        lastNameTextField.setBottomLine()
        lastNameTextField.setBottomLine(borderColor: UIColor.gray)
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        firstNameTextField.setBottomLine(borderColor: UIColor.gray)
        firstNameTextField.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                                     attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        
        performSegue(withIdentifier: "agreementSegue", sender: nil)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {

        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       self.AdjustConstraint()
        
    }
    
    func AdjustConstraint() {
        if UIDevice.current.orientation.isPortrait {
            self.topConstraint.constant = 130.00
        }
        else {
            self.topConstraint.constant = 00.00
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension UITextField {
    
    func setBottomLine(borderColor: UIColor) {
        
        self.borderStyle = UITextBorderStyle.none
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.withAlphaComponent(1.0).cgColor
            
//            UIColor.lightGrayColor().colorWithAlphaComponent(0.2).CGColor

        
//        self.borderStyle = UITextBorderStyle.none
//        self.backgroundColor = UIColor.clear
//
//        let borderLine = UIView()
//        let height = 1.0
//        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
//
//        borderLine.backgroundColor = borderColor
//        self.addSubview(borderLine)
    }
}



