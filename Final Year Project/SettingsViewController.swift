//
//  SettingsViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /179/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {


    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Settings"

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var languagePicker: UIPickerView!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
        if indexPath.section == 3{
            let alertController = UIAlertController(title: nil, message: "Do you really want to reset the app? You will lose all your data.", preferredStyle: .ActionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "I'm sure", style: .Destructive) { (action) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
                self.doubleConfirm("Reset")
                // ...
            }
            alertController.addAction(OKAction)
            
        
            alertController.popoverPresentationController?.sourceView = tableView
            self.presentViewController(alertController, animated: true){
                
            }}
            
            else if indexPath.section == 2 && indexPath.row == 0 {
                self.showLanguageOptions()
            }
            
        
    }
    
    func doubleConfirm(alertTitle: String){
        let alertController = UIAlertController(title: alertTitle, message: "Are You Sure?", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "I'm sure", style: .Destructive) { (action) in
            if alertTitle == "Reset"{
                self.resetEverything()}
        }
        alertController.addAction(OKAction)
        
        
        alertController.popoverPresentationController?.sourceView = tableView
        self.presentViewController(alertController, animated: true){
            
        }

    }
    func resetEverything(){
        variables.defaults.removeObjectForKey("userSet")
        variables.defaults.removeObjectForKey("userName")
        variables.defaults.removeObjectForKey("userAge")
        variables.defaults.removeObjectForKey("userWeight")
        variables.defaults.removeObjectForKey("userBenchAtBegin")
        variables.defaults.removeObjectForKey("userSquatAtBegin")
        variables.defaults.removeObjectForKey("userDeadliftAtBegin")
        do{
            try variables.fileManager.removeItemAtPath("\(variables.filePath)/profile_photo.png")}
        catch{
            
        }
        performSegueWithIdentifier("reset", sender: self)
        
    }



    func showLanguageOptions(){

        let alertController = UIAlertController(title: nil, message: "Choose your preferred language.", preferredStyle: .ActionSheet)
        let option0Action = UIAlertAction(title: "English", style: .Default) { (action) in
            alertController.dismissViewControllerAnimated(true, completion: nil)
            self.doubleConfirm("Change language to English")
        }
        alertController.addAction(option0Action)
        
        let option1Action = UIAlertAction(title: "中文", style: .Default) { (action) in
            alertController.dismissViewControllerAnimated(true, completion: nil)
            self.doubleConfirm("Change language to Chinese")
        }
        alertController.addAction(option1Action)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = tableView
        self.presentViewController(alertController, animated: true){
            
        }
        
    }

    @IBAction func backToSettings(segue: UIStoryboardSegue){
        
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let sec = 4
        return sec
    }

}
