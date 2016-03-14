//
//  InterfaceController.swift
//  FYP_AW Extension
//
//  Created by Wang Longfei on /610/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
       // WeightLabel.setText("100kg")
//        if let remainSet: Int = context as? Int{
//            print("enter context main")
//            pnp1.B_set = remainSet
//            remainSetLabel.setText(String(remainSet))
//        }
        
        // Configure interface objects here.
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return self.pnp1.getCurrentLift()
    }

    //@IBOutlet var SetsCount: WKInterfaceLabel!
    @IBOutlet var RPEDescription: WKInterfaceLabel!
    @IBOutlet var LiftScheme: WKInterfaceLabel!
    @IBOutlet var WeightLabel: WKInterfaceLabel!
  
    @IBOutlet var remainSetLabel: WKInterfaceLabel!
    @IBOutlet var totalSetLabel: WKInterfaceLabel!
    
    var weights:[Float] = [0,0,0,0,0,0]
    let pnp1 = PNP1.init();//change to global later
    
       override func willActivate() {
        
       
        
        var prgm:NSString
        var squatMax:Float
        var deadliftMax:Float
        var benchMax: Float
        var weight: Float
        var defaultForExtension:NSUserDefaults! = NSUserDefaults(suiteName: "group.FYPGroup")
        
        if(defaultForExtension != nil){
            pnp1.currentLift = defaultForExtension.integerForKey("currentlift")
         //   print("weight" + String(defaultForExtension.floatForKey("squat")
            switch(pnp1.currentLift){
            case 0:pnp1.S_set = defaultForExtension.integerForKey("setcount"); if(pnp1.S_set == 0){pnp1.S_set = 1};WeightLabel.setText(String(weights[0]))
            case 1:pnp1.B_set = defaultForExtension.integerForKey("setcount");WeightLabel.setText(String(weights[1]))
            case 2:pnp1.D_set = defaultForExtension.integerForKey("setcount");WeightLabel.setText(String(weights[2]))
            default:pnp1.B_set = defaultForExtension.integerForKey("setcount");WeightLabel.setText("")
            }
            setLiftSchemeLabel("PNP1")//prgm)
           // WeightLabel.setText(String(weight))
        }

        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBOutlet var RecordButton: WKInterfaceButton!
    override func didDeactivate() {

        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func setLiftSchemeLabel(program:NSString){
        let date = NSDate()
        let cal = NSCalendar.currentCalendar()
        //var weekday = ""
        let comp = cal.components([.Day, .Month, .Year, .Weekday], fromDate: date)
        let wkday = comp.weekday

            switch(program){
            case "PNP1": if(wkday==1 || wkday==3 || wkday==5){
                LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0"); RecordButton.setHidden(true)}
            else if(wkday == 7){print("here");
                LiftScheme.setText("Conditioning"); RPEDescription.setText("Row/ab/curl max reps in 7min. HIIT and mobility work."); totalSetLabel.setText("/"); remainSetLabel.setText("/"); RecordButton.setHidden(true)}//potential problem
            else{
                setPNP1Label()
                }
                /////
            case "PNP2": if(wkday==1 || wkday==5){
                LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");}
            else
            {LiftScheme.setText("")}
                ///////
            case "PNP3": if(wkday==1 || wkday==5){
                LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");}
            else
            {LiftScheme.setText("")}
                //////
            case "PIP1": if(wkday==1 || wkday==5){
                LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");}
            else
            {LiftScheme.setText("")}
                /////
            case "PIP2": if(wkday==1 || wkday==3 || wkday==5){
                LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");}
            else
            {LiftScheme.setText("")}
                ///////////
            case "PIP3": if(wkday==1 || wkday==3 || wkday==5){
                LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");}
            else
            {LiftScheme.setText("")}
                ////////
            default: LiftScheme.setText("Rest Day! Enjoy!");remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");}
        }


    
    func setRPELabel(RPE:Int){
        
    }
  //  func setCountingLabel(){
        
    //}
    
    func setPNP1Label(){
        RPEDescription.setText("3~6 Reps until definitely can do 1 more rep but no more")
        var lift:Int = pnp1.getCurrentLift()
        var remain:Int = pnp1.getRemainSet(lift)
        var total:Int = pnp1.getTotalSet(lift)
        //print("lift:" + String(lift) + "remain:" + String(remain) + "total:" + String(total))
        remainSetLabel.setText(String(remain))
        totalSetLabel.setText(String(total))

        switch(lift){
        case 0: LiftScheme.setText("Squat")
        case 1: LiftScheme.setText("Bench Press")
        case 2: LiftScheme.setText("Deadlift")
        case 3: LiftScheme.setText("All Done!"); remainSetLabel.setText("0"); RPEDescription.setText("");totalSetLabel.setText("0");RecordButton.setHidden(true);
        default: LiftScheme.setText("ELL DONE");
        }
    }

    //////test receiving
    var session: WCSession!
    
    override init() {
        super.init()
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        let squat = applicationContext["squat"] as! Float
        let bench = applicationContext["bench"] as! Float
        let deadlift = applicationContext["deadlift"] as! Float
        //print("receiving from iOS " + String(squat))
        
        dispatch_async(dispatch_get_main_queue()) {
           // self.LiftScheme.setText(receivedTest! + " received")
            //self.WeightLabel.setText(String(squat))
            self.weights[0]=squat
            self.weights[1]=bench
            self.weights[2]=deadlift
        }
        
    }

    
    
    
    
    
}







