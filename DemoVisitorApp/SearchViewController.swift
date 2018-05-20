//
//  SearchViewController.swift
//  DemoVisitorApp
//
//  Created by V2Solutions on 19/05/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit


class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchUser: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let textFieldInsideSearchBar = self.searchUser.value(forKey: "searchField") as! UITextField
        textFieldInsideSearchBar.leftViewMode = UITextFieldViewMode.never
        self.customizeSearchBar()
        
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        
        //        performSegue(withIdentifier: "chekInChecOutSegue", sender: nil)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
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
    
}
