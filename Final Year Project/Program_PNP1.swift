//
//  Program_PNP1.swift
//  Final Year Project
//
//  Created by Wang Longfei on /12/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import Foundation
class Program_PNP1{
    
    
    var intro:String
    //
    var name:String
    //
    var sessionList = [session]()
    //
    //    init(intro: String, name: String, sessionList:[session] ){
    //        self.intro = intro
    //        self.name = name
    //        self.sessionList = sessionList
    //    }
    init(){
        self.intro = "this is PNP1!"
        self.name = "PNP1"
        self.sessionList = [PNP1.session_1, PNP1.session_2, PNP1.session_3, PNP1.session_4]
    }
    
    struct PNP1 {
        
        
        static let nameKey = "PNP1"
        static let introKey = "PNP1_introduction"
        static let sessionKey = "PNP1_sessions"
        /*session 1 on mondays*/
        static let lift_1_1 = lifts.init(name: "Squat", reps_low: 3, reps_up: 6, sets: 2, RPE: 9, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_1_2 = lifts.init(name: "Bench Press", reps_low: 3, reps_up: 6, sets: 3, RPE: 9, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_1_3 = lifts.init(name: "Deadlift", reps_low: 3, reps_up: 6, sets: 1, RPE: 9, fatigue_low: 2, fatigue_up: 4, method: -1)
        static let list_1 = [lift_1_1, lift_1_2, lift_1_3]
        static let date_1 = "mon"
        static let session_1 = session.init(date: date_1 , lift: list_1)
        /*session 2 on wednesdays*/
        static let date_2 = "wed"
        static let session_2 = session.init(date: date_2, lift: list_1)
        /*session 3 on fridays*/
        static let date_3 = "fri"
        static let session_3 = session.init(date: date_3, lift: list_1)
        /*session 4 on saturdays*/
        static let lift_2_1 = lifts.init(name: "row", reps_low: 0, reps_up: 25, sets: 1, RPE: 0, fatigue_low: 0, fatigue_up: 0, method: 0)
        static let lift_2_2 = lifts.init(name: "abs", reps_low: 0, reps_up: 25, sets: 1, RPE: 0, fatigue_low: 0, fatigue_up: 0, method: 0)
        static let lift_2_3 = lifts.init(name: "curls", reps_low: 0, reps_up: 25, sets: 0, RPE: 0, fatigue_low: 0, fatigue_up: 0, method: 0)
        static let lift_2_4 = lifts.init(name: "conditioning and mobility", reps_low: 0, reps_up: 0, sets: 0, RPE: 0, fatigue_low: 0, fatigue_up: 0, method: 0)
        static let list_2 = [lift_2_1, lift_2_2, lift_2_3, lift_2_4]
        static let date_4 = "sat"
        static let session_4 = session.init(date: date_4, lift: list_2)
        
        
    }
    
}