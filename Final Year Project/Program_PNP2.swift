//
//  Program_PNP2.swift
//  Final Year Project
//
//  Created by Wang Longfei on /12/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import Foundation
//
//  Program_PNP2.swift
//  Final Year Project
//
//  Created by Wang Longfei on /12/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//
class Program_PNP2{
    
    
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
        self.intro = "this is PNP2!"
        self.name = "PNP2"
        self.sessionList = [PNP2.session_1, PNP2.session_2, PNP2.session_3, PNP2.session_4, PNP2.session_5]
    }
    
    struct PNP2 {
        
        
        static let nameKey = "PNP2"
        static let introKey = "PNP2_introduction"
        static let sessionKey = "PNP2_sessions"
        /*session 1 on mondays*/
        static let lift_1_1 = lifts.init(name: "Squat", reps_low: 3, reps_up: 6, sets: 3, RPE: 9, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_1_2 = lifts.init(name: "Bench Press", reps_low: 3, reps_up: 6, sets: 5, RPE: 9, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_1_3 = lifts.init(name: "Deadlift", reps_low: 3, reps_up: 6, sets: 2, RPE: 9, fatigue_low: 2, fatigue_up: 4, method: -1)
        static let list_1 = [lift_1_1, lift_1_2, lift_1_3]
        static let date_1 = "mon"
        static let session_1 = session.init(date: date_1 , lift: list_1)
        /*session 2 on tuesdays*/
        static let lift_2_1 = lifts.init(name: "row", reps_low: 0, reps_up: 25, sets: 1, RPE: -1, fatigue_low: -1, fatigue_up: -1, method: 0)
        static let lift_2_2 = lifts.init(name: "abs", reps_low: 0, reps_up: 25, sets: 1, RPE: -1, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_2_3 = lifts.init(name: "curls", reps_low: 0, reps_up: 25, sets: 1, RPE: -1, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_2_4 = lifts.init(name: "conditioning and mobility", reps_low: -1, reps_up: -1, sets: -1, RPE: -1, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let list_2 = [lift_2_1, lift_2_2, lift_2_3, lift_2_4]
        static let date_2 = "tues"
        static let session_2 = session.init(date: date_2, lift: list_2)
        /*session 2 on wednesdays*/
        static let lift_3_1 = lifts.init(name: "2s Paused Squat", reps_low: 3, reps_up: 6, sets: 2, RPE: 9, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let lift_3_2 = lifts.init(name: "2s Paused Bench Press", reps_low: 3, reps_up: 6, sets: 2, RPE: 9, fatigue_low: -1, fatigue_up: -1, method: -1)
        static let list_3 = [lift_3_1, lift_3_2]
        static let date_3 = "wed"
        static let session_3 = session.init(date: date_3, lift: list_3)
        /*session 3 on fridays*/
        static let date_4 = "fri"
        static let session_4 = session.init(date: date_4, lift: list_1)
        /*session 4 on saturdays*/
                static let date_5 = "sat"
        static let session_5 = session.init(date: date_5, lift: list_2)
        
        
    }
    
}