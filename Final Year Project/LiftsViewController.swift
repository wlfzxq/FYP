//
//  liftsViewController.swift
//  
//
//  Created by Wang Longfei on /149/15.
//
//

import UIKit

class LiftsViewController: UIViewController, setUserLiftsDelegate {


    var age: Int = 1
    var name: String = ""
    var weight: Float = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        variables.user.liftDelegate = self
       // print(defaults.objectForKey("userStat1")?.age, appendNewline: true)
        //print(defaults.objectForKey("userStat1")?.name, appendNewline: true)
        //print(defaults.objectForKey("userStat1")?.weight, appendNewline: true)
//        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
//        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Right
//        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @IBOutlet weak var benchTextField: UITextField!
 

    @IBAction func saveLiftsData(sender: UIButton) {
        
        if benchTextField.text! == "" || deadliftTextField.text! == "" || squatTextField.text! == "" {
            let alertController = UIAlertController(title: nil, message: "Incomplete data.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true){            }
        }
        else{
        variables.user.liftDelegate?.setUserLifts(variables.user)
            variables.core_data.deadlift_max.append(variables.user.deadlift)
            variables.core_data.bench_max.append(variables.user.bench)
            variables.core_data.squat_max.append(variables.user.squat)
        variables.defaults.setObject(variables.user.name, forKey: "userName")
        variables.defaults.setInteger(variables.user.age, forKey: "userAge")
        variables.defaults.setFloat(variables.user.weight, forKey: "userWeight")
        variables.defaults.setFloat(variables.user.bench, forKey: "userBenchAtBegin")
        variables.defaults.setFloat(variables.user.squat, forKey: "userSquatAtBegin")
        variables.defaults.setFloat(variables.user.deadlift, forKey: "userDeadliftAtBegin")
        variables.defaults.setFloat(variables.core_data.squat_max[0], forKey: "initialSQMax")
        variables.defaults.setFloat(variables.core_data.bench_max[0], forKey: "initialBPMax")
        variables.defaults.setFloat(variables.core_data.deadlift_max[0], forKey: "initialDLMax")
            variables.core_data.updateLastLifts()
            self.performSegueWithIdentifier("toThi", sender: self)
        }
    }

    @IBOutlet weak var deadliftTextField: UITextField!
    @IBOutlet weak var squatTextField: UITextField!
    
    func setUserLifts(controller: UserDetail) {
        controller.bench = Float(benchTextField.text!)!
        controller.squat = Float(squatTextField.text!)!
        controller.deadlift = Float(deadliftTextField.text!)!
        
    }

//    func showSecondViewController() {
//        self.performSegueWithIdentifier("BackToAboutYou", sender: self)
//    }
//    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
//        if sender.identifier == "idFirstSegueUnwind" {
//            let originalColor = self.view.backgroundColor
//            self.view.backgroundColor = UIColor.redColor()
//            
//            UIView.animateWithDuration(1.0, animations: { () -> Void in
//                self.view.backgroundColor = originalColor
//            })
//        }
//    }

}
