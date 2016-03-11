//
//  ProgramDetailController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /159/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit

class RecommendationController: UIViewController, setUserProgramDelegate {
    
    var RecProgram = ""

    override func viewDidLoad() {
        variables.user.programDelegate = self
        switch variables.user.classification{
            case "beginner": descriptionTextField.text = "You are a beginner lifter. We recommend True Novice Program to you."; RecProgram = "PNP1"
            case "class IV": descriptionTextField.text = "You are a Class IV lifter. We recommend Intermediate Novice Program to you."; RecProgram = "PNP2"
            case "class III": descriptionTextField.text = "You are a Class III lifter. We recommend Advanced Novice Program to you."; RecProgram = "PNP3"
            case "class II": descriptionTextField.text = "You are a Class II lifter. We recommend Intermediate Program to you.";RecProgram = "PIP1"
            case "class I": descriptionTextField.text = "You are a Class I lifter. We recommend Advanced Intermediate Program to you.";RecProgram = "PIP3"
            case "master": descriptionTextField.text = "You are a Master lifter. This app is dedicated for novice and intermediate level lifters. Sorry we cannot help you:-("
            case "elite": descriptionTextField.text = "You are an Elite lifter. This app is dedicated for novice and intermediate level lifters. Sorry we cannot help you:-("
        default: descriptionTextField.text = "UNDEFINED"
        }
        
        if variables.user.level>4{
            programListButton.removeFromSuperview()
            beginButton.removeFromSuperview()
        }
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func confirmRecom(sender: UIButton) {
        print("confirmed program " + RecProgram)
        variables.user.programDelegate?.setUserProgram(variables.user)
        variables.defaults.setObject(variables.user.curProgram, forKey: "CurrentProgram")
        print("program saved " + variables.user.curProgram)
    }

    @IBOutlet weak var programListButton: UIButton!
    @IBOutlet weak var beginButton: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBAction func backToRecomm(segue: UIStoryboardSegue){
        
        
    }
    func setUserProgram(controller: UserDetail) {
        print("setting user program: " + RecProgram)
        controller.curProgram = RecProgram
        print("After setting: " + controller.curProgram)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
