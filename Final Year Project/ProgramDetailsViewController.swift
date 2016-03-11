//
//  ProgramDetailsViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /179/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit
protocol ProgramDetailsViewControllerDelegate: class  {
    func setTitleBar(controller: ProgramDetailsViewController)
    func setChosenProgram(controller: ProgramDetailsViewController)
}


class ProgramDetailsViewController: UIViewController {
    
    var programChosen = "hi"
    
    var barTitle = ""
    weak var delegate = ProgramDetailsViewControllerDelegate?()
    @IBOutlet weak var confirmButton: UIButton!
   // @IBOutlet weak var programDescription: UITextView!
   
    var prev = "first"
    override func viewWillAppear(animated: Bool) {
        delegate?.setChosenProgram(self)
        print("intro")
        print(programChosen)
        programDetails.image = GetImage(programChosen)
        //programChosen = delegate
        //Program_PNP3.init()
        super.viewWillAppear(true)
        delegate?.setTitleBar(self)
        NavigationBar.title = barTitle
        if prev != "first" {
            confirmButton.removeFromSuperview()
        }

      //  programDescription.text = "testing:" + String(Program_PNP3.init().sessionList.count)//testing only
    }
    @IBOutlet weak var programDetails: UIImageView!
    
    func GetImage(ProgramName: String)->UIImage{
        var imageName:String
        if(ProgramName == "PIP1"){
            imageName = "pip1"
        }
        else if(ProgramName == "PIP2"){
            imageName = "pip2"
        }
        else if(ProgramName == "PIP3"){
            imageName = "pip3"
        }
        else if(ProgramName == "PNP1"){
            imageName = "pnp1"
        }
        else if(ProgramName == "PNP2"){
            imageName = "pnp2"
        }
        else if(ProgramName == "PNP3"){
            imageName = "pnp3"
        }
        else {imageName = "pnp1"}
        
        return UIImage(named: (imageName))!
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //self.programDetails.text = Program_PNP3.PNP3.introKey
        // Do any additional setup after loading the view.
    }
    //@IBOutlet weak var programDetails: UITextView!
    @IBOutlet weak var NavigationBar: UINavigationItem!
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToProgramDetail(segue: UIStoryboardSegue){
        
        
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
