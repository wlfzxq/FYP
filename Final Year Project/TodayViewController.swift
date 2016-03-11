//
//  TodayViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /162/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    @IBOutlet weak var DateLabel: UILabel!
    let date = NSDate()
    let cal = NSCalendar.currentCalendar()
    var weekday = ""
    var prgm = ""
    override func viewDidLoad() {
        prgm = variables.user.curProgram
        
        print(prgm);
        let comp = cal.components([.Day, .Month, .Year, .Weekday], fromDate: date)
        let year = comp.year
        let month = comp.month
        //@IBOutlet weak var ExtContent: UILabel!
        let day = comp.day
        let wkday = comp.weekday
        switch(wkday){
        case 2: weekday = "Monday"
        case 3: weekday = "Tuesday"
        case 4: weekday = "Wednesday"
        case 5: weekday = "Thursday"
        case 6: weekday = "Friday"
        case 7: weekday = "Saturday"
        case 1: weekday = "Sunday"
        default: weekday = String(wkday)
        }
        switch(prgm){
            case "PNP1": setPNP1()
            case "PNP2": setPNP2()
            case "PNP3": setPNP3()
            case "PIP1": setPIP1()
            case "PIP2": setPIP2()
            case "PIP3": setPIP3()
        default: print("default here");setPNP1()
        }
        DateLabel.text = "Today is " + String(month) + "/" + String(day) + "/" + String(year) + " " + weekday
        
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var lift_1: UILabel!
    @IBOutlet weak var lift_2: UILabel!
    @IBOutlet weak var lift_4: UILabel!
    @IBOutlet weak var lift_3: UILabel!
    
    @IBOutlet weak var lift1_detail: UITextView!
    @IBOutlet weak var lift2_detail: UITextView!
    @IBOutlet weak var lift3_detail: UITextView!
    @IBOutlet weak var lift4_detail: UITextView!
    
    
    
    
    
    func setPNP1(){
        switch(weekday){
            case "Monday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = "";
            lift1_detail.text = "3 sets of 3-6 reps at RPE 9 "; lift2_detail.text = "2 sets of 3-6 reps at RPE 9 "; lift3_detail.text = "1 set of 3-6 reps at RPE 9 ";lift4_detail.text = "" ;
            
            case "Wednesday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = "";
            lift1_detail.text = "3 sets of 3-6 reps at RPE 9 "; lift2_detail.text = "2 sets of 3-6 reps at RPE 9 "; lift3_detail.text = "1 set of 3-6 reps at RPE 9 ";lift4_detail.text = ""
           
            case "Friday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = "";
            lift1_detail.text = "3 sets of 3-6 reps at RPE 9 "; lift2_detail.text = "2 sets of 3-6 reps at RPE 9 "; lift3_detail.text = "1 set of 3-6 reps at RPE 9 ";lift4_detail.text = ""
            
            case "Tuesday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
            case "Sunday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
            case "Thursday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
            case "Saturday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility"
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
            
        default: lift_1.text = "";lift_2.text = "";lift_3.text = ""; lift_4.text = "";lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = ""
        }
    }
    
    func setPNP2(){
        switch(weekday){
        case "Monday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = "";
            lift1_detail.text = "5 sets of 3-6 reps at RPE 9 "; lift2_detail.text = "3 sets of 3-6 reps at RPE 9 "; lift3_detail.text = "2 set of 3-6 reps at RPE 9 ";lift4_detail.text = ""
            
        case "Wednesday": lift_1.text = "2-count Pause Bench Press"; lift_2.text = "2-count Pause Squat"; lift_3.text = "";lift_4.text = "";
            lift1_detail.text = "2 sets of 3-6 reps at RPE 9 "; lift2_detail.text = "2 sets of 3-6 reps at RPE 9 "; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Friday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = ""
            lift1_detail.text = "5 sets of 3-6 reps at RPE 9 "; lift2_detail.text = "3 sets of 3-6 reps at RPE 9 "; lift3_detail.text = "2 set of 3-6 reps at RPE 9 ";lift4_detail.text = ""
            
        case "Tuesday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
            
        case "Sunday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Thursday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Saturday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
            
        default: lift_1.text = "";lift_2.text = "";lift_3.text = ""; lift_4.text = "";lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
        }
    }
    
    func setPNP3(){
        switch(weekday){
        case "Monday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = "";
            lift1_detail.text = "3-6 reps at RPE 9, Fatigue 5-10%, use load drop method "; lift2_detail.text = "3-6 reps at RPE 9, fatigue 3-6%, use load drop method"; lift3_detail.text = "3-6 reps at RPE 9, fatigue 2-4%, use load drop method ";lift4_detail.text = ""
        case "Wednesday": lift_1.text = "2-count Pause Bench Press"; lift_2.text = "2-count Pause Squat"; lift_3.text = "";lift_4.text = ""
            lift1_detail.text = "3-6 reps at RPE 8, fatigue 2-3%, use repeat method "; lift2_detail.text = "3-6 reps at RPE 8, fatigue 2-3%, use repeat method"; lift3_detail.text = "";lift4_detail.text = ""
        case "Friday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = "";
            lift1_detail.text = "3-6 reps at RPE 9, Fatigue 5-10%, use load drop method "; lift2_detail.text = "3-6 reps at RPE 9, fatigue 3-6%, use load drop method"; lift3_detail.text = "3-6 reps at RPE 9, fatigue 2-4%, use load drop method ";lift4_detail.text = ""
            
        case "Tuesday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
            
        case "Sunday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Thursday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = ""
        lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Saturday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
        default: lift_1.text = "";lift_2.text = "";lift_3.text = ""; lift_4.text = "";lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
        }
    }
    func setPIP1(){
        switch(weekday){
        case "Monday": lift_1.text = "2-count Pause Bench Press"; lift_2.text = "2-count Pause Squat"; lift_3.text = "Deficit Deadlift";lift_4.text = "Close Grip Bench Press"
            lift1_detail.text = "4-6 reps at RPE 9, Fatigue 6-9%, use load drop method "; lift2_detail.text = "4-6 reps at RPE 9, fatigue 3-6%, use load drop method"; lift3_detail.text = "4-6 reps at RPE 9, fatigue 4-6%, use load drop method ";lift4_detail.text = "4-6 reps at RPE 9, fatigue 4-6%, use load drop method"
            
        case "Wednesday": lift_1.text = "Incline Bench Press"; lift_2.text = "Front Squat"; lift_3.text = "";lift_4.text = ""
             lift1_detail.text = "6-8 reps at RPE 7, Fatigue 4-6%, use repeat method "; lift2_detail.text = "6-8 reps at RPE 7, Fatigue 4-6%, use repeat method "; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Friday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = ""
             lift1_detail.text = "1-3 reps at RPE 9, Fatigue 4-6%, use load drop method "; lift2_detail.text = "1-3 reps at RPE 9, Fatigue 2-3%, use load drop method "; lift3_detail.text = "1-3 reps at RPE 9, Fatigue 2-3%, use load drop method ";lift4_detail.text = ""
            
        case "Tuesday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
        case "Sunday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Thursday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Saturday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
        default: lift_1.text = "";lift_2.text = "";lift_3.text = ""; lift_4.text = "";lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
        }
    }
    func setPIP2(){
        switch(weekday){
        case "Monday": lift_1.text = "2-count Pause Bench Press"; lift_2.text = "2-count Pause Squat"; lift_3.text = "Incline Bench Press";lift_4.text = "";
            lift1_detail.text = "6/5/4 reps at RPE 9, Fatigue 6-9%, use load drop method "; lift2_detail.text = "6/5/4 reps at RPE 9, fatigue 6-9%, use load drop method"; lift3_detail.text = "8/7/6 reps at RPE 8, fatigue 4-6%, use repeat method ";lift4_detail.text = ""
            
        case "Wednesday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
            
        case "Friday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Overhead Press";lift_4.text = "";
            lift1_detail.text = "3/2/1 reps at RPE 9, Fatigue 2-3%, use load drop method "; lift2_detail.text = "3/2/1 reps at RPE 9, fatigue 2-3%, use load drop method"; lift3_detail.text = "8/7/6 reps at RPE 8, fatigue 4-6%, use repeat method ";lift4_detail.text = ""
            
        case "Tuesday": lift_1.text = "Close Grip Bench Press";lift_2.text = "Deficit Deadlift";lift_3.text = "Front Sqaut"; lift_4.text = "";
             lift1_detail.text = "6/5/4 reps at RPE 9, Fatigue 6-9%, use load drop method "; lift2_detail.text = "6/5/4 reps at RPE 9, fatigue 6-9%, use load drop method"; lift3_detail.text = "8/7/6 reps at RPE 8, fatigue 4-6%, use repeat method ";lift4_detail.text = ""
            
        case "Sunday":lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
            
        case "Thursday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
            lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Saturday": lift_1.text = "Bench Press"; lift_2.text = "Deadlift"; lift_3.text = "Deficit Stiff Leg Deadlift";lift_4.text = "";
            lift1_detail.text = "3/2/1 reps at RPE 9, Fatigue 2-3%, use load drop method "; lift2_detail.text = "3/2/1 reps at RPE 9, fatigue 2-3%, use load drop method"; lift3_detail.text = "8/7/6 reps at RPE 8, fatigue 4-6%, use repeat method ";lift4_detail.text = ""
            
        default: lift_1.text = "";lift_2.text = "";lift_3.text = ""; lift_4.text = "";lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
        }
    }
    func setPIP3(){
        switch(weekday){
        case "Monday": lift_1.text = "2-count Pause Bench Press"; lift_2.text = "2-count Pause Squat"; lift_3.text = "Incline Bench Press";lift_4.text = ""
        case "Wednesday": lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
        case "Friday": lift_1.text = "Bench Press"; lift_2.text = "Squat"; lift_3.text = "Deadlift";lift_4.text = ""
        case "Tuesday": lift_1.text = "Close Grip Bench Press";lift_2.text = "Deficit Deadlift";lift_3.text = "Front Sqaut"; lift_4.text = ""
        case "Sunday":lift_1.text = "Row";lift_2.text = "Ab&Curl";lift_3.text = "Conditioning"; lift_4.text = "Mobility";
            lift1_detail.text = "Max reps in 7 minutes"; lift2_detail.text = "Max reps in 7 minutes"; lift3_detail.text = "7 sets of HIIT Sprint"; lift4_detail.text = "5 to 10 minutes"
        case "Thursday": lift_1.text = "No training today!";lift_2.text = "Have a good rest!";lift_3.text = ""; lift_4.text = "";
        lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
            
        case "Saturday": lift_1.text = "Bench Press"; lift_2.text = "Deadlift"; lift_3.text = "Deficit Stiff Leg Deadlift";lift_4.text = ""
        default: lift_1.text = "";lift_2.text = "";lift_3.text = ""; lift_4.text = "";lift1_detail.text = ""; lift2_detail.text = ""; lift3_detail.text = "";lift4_detail.text = ""
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

