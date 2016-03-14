//
//  Set.swift
//  Final Year Project
//
//  Created by Wang Longfei on /143/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import Foundation
class set {
    
    var lifts_to_do:[String] = []
    var reps_to_do:[Int] = []
    var weights_to_use:[Float] = []
    var fatigue:[Int] = []
    var method:String = ""
    var RPE:Int = 6;
    var setCount:[Int] = [];
    
    init(lift:[String],reps:[Int],fatigue:[Int],method:String, weights:[Float], rpe:Int, count:[Int]){
        self.fatigue = fatigue
        self.lifts_to_do = lift
        self.reps_to_do = reps
        self.method = method
        self.weights_to_use = weights
        self.RPE = rpe
        self.setCount = count
    }
    
    
}