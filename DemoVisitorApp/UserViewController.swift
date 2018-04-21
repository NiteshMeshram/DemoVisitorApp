//
//  UserViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 18/03/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation


import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var personToMeetTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let placeHolderColor = UIColor(red: 138.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1.0)
        
        personToMeetTextField.setBottomBorder()
        personToMeetTextField.attributedPlaceholder = NSAttributedString(string: "Person You Are Here To Meet",
                                                               attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        
        
        companyTextField.setBottomBorder()
        companyTextField.attributedPlaceholder = NSAttributedString(string: "Your Company",
                                                                         attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        emailTextField.setBottomBorder()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Your Email",
                                                                    attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        
        lastNameTextField.setBottomBorder()
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: placeHolderColor])
        firstNameTextField.setBottomBorder()
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
    
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
