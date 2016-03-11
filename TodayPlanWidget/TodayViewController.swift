//
//  TodayViewController.swift
//  TodayPlanWidget
//
//  Created by Wang Longfei on /93/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
//        ExtContent.text = "Rest Day! Enjoy!"
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var ExtContent: UILabel!
    
    @IBAction func GoToApp(sender: AnyObject) {
        extensionContext?.openURL(NSURL(string: "MainApp://GoToApp")!, completionHandler: nil)
    }
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func setText(){
        let date = NSDate()
        let cal = NSCalendar.currentCalendar()
        //var weekday = ""
        let comp = cal.components([.Day, .Month, .Year, .Weekday], fromDate: date)
        let wkday = comp.weekday
        
        var defaultForExtension:NSUserDefaults! = NSUserDefaults(suiteName: "group.FYPGroup")
        var prgm:NSString;
        
        if(defaultForExtension != nil){
            prgm = defaultForExtension.objectForKey("Program") as! NSString
            print(prgm)
        
        switch(prgm){
        case "PNP1": if(wkday==1 || wkday==3 || wkday==5){
            ExtContent.text = "Rest Day"}
        else
        {ExtContent.text = "Training Today"} ;
        case "PNP2": if(wkday==1 || wkday==5){
            ExtContent.text = "Rest Day"}
        else
        {ExtContent.text = "Training Today"} ;
        case "PNP3": if(wkday==1 || wkday==5){
            ExtContent.text = "Rest Day"}
        else
        {ExtContent.text = "Training Today"} ;
        case "PIP1": if(wkday==1 || wkday==5){
            ExtContent.text = "Rest Day"}
        else
        {ExtContent.text = "Training Today"} ;
        case "PIP2": if(wkday==1 || wkday==3 || wkday==5){
            ExtContent.text = "Rest Day"}
        else
        {ExtContent.text = "Training Today"} ;
        case "PIP3": if(wkday==1 || wkday==3 || wkday==5){
            ExtContent.text = "Rest Day"}
        else
        {ExtContent.text = "Training Today"} ;
        default: ExtContent.text = "Rest Today"}
        }
       
    }
    
}
