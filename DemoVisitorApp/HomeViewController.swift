//
//  HomeViewController.swift
//  DemoVisitorApp
//
//  Created by Nitesh Meshram on 3/5/18.
//  Copyright © 2018 V2Solutions. All rights reserved.
//

import UIKit

class HomeViewController: BaseviewController,UITextFieldDelegate {

    var initialOrientation = true
    var isInPortrait = false
    
    var activationCode : String = ""
    var userDeviceId: String?
    
    @IBOutlet weak var topLine1Label: UILabel!
    //    @IBOutlet weak var topLine1Label: UILabel!
    @IBOutlet weak var topLine2Label: UILabel!
    @IBOutlet weak var activationCodeText: UITextField!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var userActivation: UserDeviceDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activationCodeText.text = self.userActivation?.activation_code
        self.topLine1Label.text = self.userActivation?.topline1text
        self.topLine2Label.text = self.userActivation?.topline2text
        
        self.AdjustConstraint()
        print("1st")
        
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        self.navigationController!.viewControllers.removeAll()

        self.AdjustConstraint()
         print("3st")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
         print("2st")
    }

    @IBAction func nextButtonClick(_ sender: Any) {
        
    }
    
    @IBAction func activateNowClicked(_ sender: Any) {
        self.activationAPICall()

//        self.performSegue(withIdentifier: "mainFlowSegue", sender: nil)
    }
    

    override func viewWillLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
         print("4st")

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
    
//    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
//    {
//        textField.resignFirstResponder()
//        return true
//    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainFlowSegue" {
//            let videoPlayerViewController = segue.destination as? FNSAVPlayerViewController
//
//            if let _ = mediaArray[selectedIndex].url {
//                videoPlayerViewController?.videoURL = mediaArray[selectedIndex].url!
//            }
        }
    }
    
    
    func activationAPICall() {
        var loginDict = [String: Any]()
        
        let userDefaults = UserDefaults.standard
        if let key = userDefaults.object(forKey: "userDeviceId"){
            // exist
            if let uuid = userDefaults.string(forKey: key as! String){
                self.userDeviceId = uuid
            }
        }
        else {
            // not exist
            self.userDeviceId = UIDevice.current.identifierForVendor?.uuidString
        }
        
        loginDict = ["a":"activate-device" ,
                     "deviceid":self.userDeviceId!,
                     "acode": self.userActivation?.activation_code as! String]

        DataManager.activationWithKey(userDetailDict: loginDict, closure: {Result in
            
            switch Result {
            case .success(let activationDetails):
//                self.performSegue(withIdentifier: "mainFlowSegue", sender: nil)
                
                if !activationDetails.hasError {
                    self.performSegue(withIdentifier: "mainFlowSegue", sender: nil)

                }
                else {

                }
                break
            case .failure(let errorMessage):
                print(errorMessage)
                
                break
            }
        })
        
    }
    
}
