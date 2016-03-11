//
//  Sessions.swift
//  Final Year Project
//
//  Created by Wang Longfei on /139/15.
//  Copyright (c) 2015 Wang Longfei. All rights reserved.
//

import Foundation



class session {
    
    
    var date: String
    var lift = [lifts]()
    //var breakTime: NSTimer = ...
    


//    struct lifts{
//        var name: String
//        var RPE: Float = 0
//        var sets: Int = 0
//        var repPerSet: Int = 0
//        var fatigue: Int = 0
//        var method:Int = 0 //0-dropback 1-repeat
//        }
    
    
    
//    var method = 0 //0-dropback 1-repeat
    
    init(date: String, lift: [lifts]){
       // self.method = method
        self.date = date
        self.lift = lift
    }
}