//
//  SearchViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 19/05/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit


class SearchViewController: BaseviewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchUser: UISearchBar!
    @IBOutlet weak var userOneButton: UIButton!
    @IBOutlet weak var userList: UIButton!
    
    var initialOrientation = true
    var isInPortrait = false
    
    var comingFrom: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.AdjustConstraint()
        
        let textFieldInsideSearchBar = self.searchUser.value(forKey: "searchField") as! UITextField
        textFieldInsideSearchBar.leftViewMode = UITextFieldViewMode.never
//        self.searchUser.appearance()
        UISearchBar.appearance().backgroundColor = UIColor.clear
        self.customizeSearchBar()
        
        if comingFrom == "checkOut" {
            
            userList.isHidden = false
            userOneButton.isHidden = true
        }
        else {
            userList.isHidden = true
            userOneButton.isHidden = false
        }
        
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        
        //        performSegue(withIdentifier: "chekInChecOutSegue", sender: nil)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func userOneSelected(_ sender: Any) {
//
        performSegue(withIdentifier: "thankYouSegue", sender: nil)

    }
    
    @IBAction func userListSelected(_ sender: Any) {
    
        performSegue(withIdentifier: "thankYouSegue", sender: nil)
    }
    
    func customizeSearchBar()
    {
        for subview in searchUser.subviews
        {
            for view in subview.subviews
            {
                if let searchField = view as? UITextField
                {
                    let imageView = UIImageView()
                    let image = UIImage(named: "searchImage")
                    imageView.image = image
                    let point = CGPoint(x: 523,y :100) // CGFloat, Double, Int
                    let rect = CGRect(origin: point, size: CGSize(width: 27, height: 27))
                    imageView.frame = rect
                    searchField.leftView = imageView
                    searchField.leftViewMode = UITextFieldViewMode.always
                }
            }
        }
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
    
}
