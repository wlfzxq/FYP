//
//  ViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /139/15.
//  Copyright (c) 2015 Wang Longfei. All rights reserved.
//

import UIKit



class AboutYouViewController: UIViewController, UITextFieldDelegate, setUserDataDelegate {
    

    //let user = UserDetail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.ageTextField.delegate = self
        self.weightTextField.delegate = self
         variables.user.delegate = self
       // test.text = variables.user.name
        //self.view.addSubview(test)
        //test.reloadInputViews()

        
    }
    
    
    override func viewWillAppear(animated: Bool) {

        //testLabel.text = variables.user.name

        
    }
    
  //  @IBOutlet weak var test: UILabel!
    
    
//    let test: UILabel = nil


    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var ageTextField: UITextField!

    @IBOutlet weak var weightTextField: UITextField!
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return false
    }
    
    func setUserData(controller: UserDetail) {
        
                controller.name = nameTextField.text!
        controller.age = Int(ageTextField.text!)!
            controller.weight = Float(weightTextField.text!)!
        //print(variables.user.weight, appendNewline: true)
    }
    
    @IBAction func savePersonalData(sender: UIButton) {
        if nameTextField.text! == "" || ageTextField.text! == "" || weightTextField.text! == "" {
            let alertController = UIAlertController(title: nil, message: "Incomplete data.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true){            }
        }else{

            variables.user.delegate?.setUserData(variables.user)
            self.performSegueWithIdentifier("toSec", sender: self)
        }

    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        
//    }
//
//    override func performSegueWithIdentifier(identifier: String?, sender: AnyObject?) {
//        if identifier == "toLifts" {
//            
//        }
//    }
    
}

