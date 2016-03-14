//
//  RepCountInterfaceController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /103/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class RepCountInterfaceController: WKInterfaceController, WCSessionDelegate{
    
    var currentLift:Int = 0;
    var lastSet = false
    override func awakeWithContext(context: AnyObject?) {
        currentLift = (context?.currentLift)!
        super.awakeWithContext(context)
        var defaultForExtension:NSUserDefaults! = NSUserDefaults(suiteName: "group.FYPGroup")
        if(defaultForExtension != nil){
            if let pnp1: PNP1 = context as? PNP1{
            print("enter context 2")
            if(pnp1.getCurrentLift() <= 4){
                if(defaultForExtension.integerForKey("setcount") == pnp1.getTotalSet(pnp1.currentLift)){
                    defaultForExtension.setInteger(1, forKey: "setcount")
                    defaultForExtension.setInteger(pnp1.currentLift+1, forKey: "currentlift")
                    lastSet = true
                }
                else{
                    defaultForExtension.setInteger(defaultForExtension.integerForKey("setcount")+1, forKey: "setcount")
                }
                }
            }
        }
        
        let rep1 = WKPickerItem.init()
        rep1.title = "1"
        let rep2 = WKPickerItem.init()
        rep2.title = "2"
        let rep3 = WKPickerItem.init()
        rep3.title = "3"
        let rep4 = WKPickerItem.init()
        rep4.title = "4"
        let rep5 = WKPickerItem.init()
        rep5.title = "5"
        let rep6 = WKPickerItem.init()
        rep6.title = "6"
        let rep0 = WKPickerItem.init()
        rep0.title = "0"
        let repList:[WKPickerItem] = [rep0,rep1,rep2,rep3,rep4,rep5,rep6]
        RepPicker.setItems(repList)
        RepPicker.focus()
        
    }
//    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
//        return setNum
//    }
    
    var selectedRep = 0
    //var setNum = 1
       // let program = PNP1.init()
//    let mainInt = InterfaceController()
    
    @IBOutlet var RepPicker: WKInterfacePicker!
    var session : WCSession!
//    
    override init() {
        super.init()
        setTitle("Done")
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    @IBAction func getSelectedRep(value: Int) {
        //print(value)
        selectedRep = value
    }
    override func willActivate() {
        RepPicker.setEnabled(true)
        RepPicker.setSelectedItemIndex(0)
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        print("Sending to ios: " + String(selectedRep))
        sendRepCount()
        if(lastSet){
            sendFinishSignal()
        }
        }
    
    func sendRepCount(){
        let repCountDict = ["lift": currentLift,"rep":selectedRep]
        if WCSession.isSupported() {
            do{
                try session!.updateApplicationContext(repCountDict)
                //print(String(repCountDict["rep"]) + "sent!")
            }catch{
                print("error catch")
            }
                   }
    }
    
    func sendFinishSignal(){
        let repCountDict = ["lift": -1,"rep":-1]
        if WCSession.isSupported() {
            do{
                try session!.updateApplicationContext(repCountDict)
                //print(String(repCountDict["rep"]) + "sent!")
            }catch{
                print("error catch")
            }
        }
    }

}

