//
//  Set.swift
//  Final Year Project
//
//  Created by Wang Longfei on /139/15.
//  Copyright (c) 2015 Wang Longfei. All rights reserved.
//

import Foundation


class lifts {
    

    
    init(name:String, reps_low: Int,reps_up: Int, sets: Int, RPE: Float, fatigue_low: Int, fatigue_up:Int, method: Int){
        self.fatigue_low = fatigue_low
        self.fatigue_up = fatigue_up
        self.method = method
        self.reps_low = reps_low
        self.reps_up = reps_up
        self.name = name
        self.RPE = RPE
        self.sets = sets
    }

        var name: String
        var reps_low: Int = 0
        var reps_up: Int = 0
        var sets: Int = 0
        var RPE: Float = 0
        var fatigue_low: Int = 0
        var fatigue_up: Int = 0
        var method:Int = 0 //0-dropback 1-repeat
    
    
}