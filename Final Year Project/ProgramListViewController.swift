//
//  ProgramListViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /169/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit

class ProgramListViewController: UITableViewController, ProgramDetailsViewControllerDelegate {

    @IBOutlet weak var novice1: UILabel!
    @IBOutlet weak var novice2: UILabel!
    @IBOutlet weak var novice3: UILabel!
    
    @IBOutlet weak var int1: UILabel!
    
    @IBOutlet weak var int3: UILabel!
    @IBOutlet weak var int2: UILabel!
    @IBOutlet weak var cust3: UILabel!
    
    @IBOutlet weak var cust1: UILabel!
    
    @IBOutlet weak var cust2: UILabel!
    
    var selectedRowLabel = ""
    var programChosen = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }



   //  MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let sec = 3
        return sec
    }

   // @IBOutlet weak var novice1: UILabel!
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        
//        return 0
//    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.destinationViewController.title  == "ProgramDetail" {
         let controller = segue.destinationViewController as! ProgramDetailsViewController 
            controller.prev = self.title!
            controller.delegate  = self}
        
        //segue.destinationViewController.title = novice1
        
    }
  
   
    func setTitleBar(controller: ProgramDetailsViewController) {
        controller.barTitle = selectedRowLabel
        //print(controller.barTitle, appendNewline: true)
    }

    func setChosenProgram(controller: ProgramDetailsViewController){
        controller.programChosen = programChosen
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.section.description, indexPath.row.description) {
        case ("0","0") : selectedRowLabel = "True Novice"; programChosen = "PNP1"
        case ("0","1") : selectedRowLabel = "Intermediate Novice"; programChosen = "PNP2"
        case ("0","2") : selectedRowLabel = "Advanced Novice"; programChosen = "PNP3"
        case ("1", "0") : selectedRowLabel = "Early Intermediate"; programChosen = "PIP1"
        case ("1", "1") : selectedRowLabel = "Intermediate"; programChosen = "PIP2"
        case ("1", "2") : selectedRowLabel = "Advanced Intermediate"; programChosen = "PIP3"
        //case ("2", "0") : selectedRowLabel = "Candito Linear"; programChosen = "CANTITO1"
        case ("2", "0") : selectedRowLabel = "Candito 6 Week"; programChosen = "CANDITO2"
        //case ("2", "2") : selectedRowLabel = "Simple DUP"; programChosen = "DUP"
        default : selectedRowLabel = "None Chosen"; programChosen = "NONE"
        }
        
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
