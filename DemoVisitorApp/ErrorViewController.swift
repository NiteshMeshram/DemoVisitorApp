//
//  ErrorViewController.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 07/08/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import Foundation
import UIKit

class ErrorViewController: BaseviewController,UITextFieldDelegate {
    @IBOutlet weak var errorLabel: UILabel!
    var errorMessgeText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorLabel.text = errorMessgeText
    }
}
