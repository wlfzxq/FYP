//
//  MajorData.swift
//  Final Year Project
//
//  Created by Wang Longfei on /143/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//

import Foundation


class majorData {
  
    var squat_max:[Float] = []
    var bench_max:[Float] = []
    var deadlift_max:[Float] = []
    var bench_stall:Bool = false
    var dead_stall:Bool = false
    var squat_stall:Bool = false
    
    var projected_squat_max:Float = 0
    var projected_bench_max:Float = 0
    var projected_dead_max: Float = 0
    
    var last_squat:Float = 0
    var last_bench: Float = 0
    var last_deadlift: Float = 0
    
    var last_squat_reps:Int = 0
    var last_bench_reps:Int = 0
    var last_deadlift_reps:Int = 0
    
    var next_squat:Float = 0
    var next_bench:Float = 0
    var next_deadlift:Float = 0
    ////bench accessories
    var next_clbp:Float{//close grip bench press
        get{
            return next_bench*0.8
        }
    }
    var next_pause_bp:Float{//2-count pause bench press
        get{
            return next_bench*0.7
        }
    }
    var next_OHP:Float{//over head press
        get{
            return next_bench*0.55
        }
    }
    ////squat accessories
    var next_pause_sq:Float{//2-count pause squat
        get{
            return next_squat*0.75
        }
    }
    var next_fsq:Float{//front squat
        get{
            return next_squat*0.5
        }
    }
    ////deadlift accessories
    var next_dcdl:Float{//deficit deadlift
        get{
            return next_deadlift*0.6
        }
    }
    
    
    
//    var lifts_last = [String:Float]()//for accessory work
//    var lifts_next = [String:Float]()//for accessory work
//    var lifts_reps = [String:Int]()//for accessory work
    
    var is_first_time:Int = 1 //1->first time, use user input to calculate working sets, otherwise use last_lift data
    
    
    var total:Float{
        get{
            return squat_max[squat_max.count] + bench_max[bench_max.count] + deadlift_max[deadlift_max.count]
        }
    }
    
    var projected_total: Float{
        get{
            return projected_bench_max + projected_dead_max + projected_squat_max
        }
    }
    func updateLastLifts(){
        let program:String = variables.user.curProgram
        print("updating lifts")
        switch(program){
        case "PNP1": updatePNP1Lifts()
        case "PNP2": updatePNP1Lifts()
        case "PNP3": updatePNP1Lifts()
        case "PIP1": updatePNP1Lifts()
        case "PIP2": updatePNP1Lifts()
        case "PIP3": updatePNP1Lifts()
        default: updatePNP1Lifts()
        }
        print("updating lifts done")
    }
    
    func updatePNP1Lifts(){
        print("updating pnp1 lifts")
        if(is_first_time != 1){
        last_bench = next_bench
        last_squat = next_squat
        last_deadlift = next_deadlift
        //bench
        if(last_bench_reps == 3){
            next_bench = last_bench + 0.5
        }else if(last_bench_reps == 4){
            next_bench = last_bench + 1
        }else if(last_bench_reps == 5){
            next_bench = last_bench + 2
        }else if(last_bench_reps >= 6){
            next_bench = last_bench + 5
        }else{
            next_bench = last_bench
            bench_stall = true
        }
        //squat
        if(last_squat_reps == 3){
            next_squat = last_squat + 0.5
        }else if(last_squat_reps == 4){
            next_squat = last_squat + 1
        }else if(last_squat_reps == 5){
            next_squat = last_squat + 2
        }else if(last_squat_reps >= 6){
            next_squat = last_squat + 5
        }else{
            next_squat = last_squat
            squat_stall = true
        }
        //deadlift
        if(last_deadlift_reps == 3){
            next_deadlift = last_deadlift + 0.5
        }else if(last_deadlift_reps == 4){
            next_deadlift = last_deadlift + 1
        }else if(last_deadlift_reps == 5){
            next_deadlift = last_deadlift + 2
        }else if(last_deadlift_reps >= 6){
            next_deadlift = last_deadlift + 5
        }else{
            next_deadlift = last_deadlift
            dead_stall = true
        }
        if(bench_stall && dead_stall && squat_stall){
            next_bench = next_bench*0.8
            next_deadlift = next_deadlift*0.8
            next_squat = next_squat*0.8
            variables.defaults.setObject("PNP2", forKey: "CurrentProgram")//proceed to pnp2
        }
            }
        
        else{
            last_deadlift = deadlift_max[0] * 0.78
            last_squat = squat_max[0] * 0.78
            last_bench = bench_max[0] * 0.78
            next_deadlift = last_deadlift
            next_squat = last_squat
            next_bench = last_bench
        }
        variables.defaults.setFloat(next_squat, forKey: "next_squat")
        variables.defaults.setFloat(next_deadlift, forKey: "next_deadlift")
        variables.defaults.setFloat(next_bench, forKey: "next_bench")
        variables.defaults.setFloat(last_squat, forKey: "last_squat")
        variables.defaults.setFloat(last_deadlift, forKey: "last_deadlift")
        variables.defaults.setFloat(last_bench, forKey: "last_bench")
        print("updating pnp1 lifts done")
    }
    
    func updatePNP2Lifts(){
        print("updating pnp2 lifts")
        if(is_first_time != 1){
            last_bench = next_bench
            last_squat = next_squat
            last_deadlift = next_deadlift
            //bench
            if(last_bench_reps == 3){
                next_bench = last_bench + 0.5
            }else if(last_bench_reps == 4){
                next_bench = last_bench + 1
            }else if(last_bench_reps == 5){
                next_bench = last_bench + 1
            }else if(last_bench_reps >= 6){
                next_bench = last_bench + 2
            }else{
                next_bench = last_bench
                bench_stall = true
            }
            //squat
            if(last_squat_reps == 3){
                next_squat = last_squat + 0.5
            }else if(last_squat_reps == 4){
                next_squat = last_squat + 1
            }else if(last_squat_reps == 5){
                next_squat = last_squat + 1
            }else if(last_squat_reps >= 6){
                next_squat = last_squat + 2
            }else{
                next_squat = last_squat
                squat_stall = true
            }
            //deadlift
            if(last_deadlift_reps == 3){
                next_deadlift = last_deadlift + 0.5
            }else if(last_deadlift_reps == 4){
                next_deadlift = last_deadlift + 1
            }else if(last_deadlift_reps == 5){
                next_deadlift = last_deadlift + 1
            }else if(last_deadlift_reps >= 6){
                next_deadlift = last_deadlift + 2
            }else{
                next_deadlift = last_deadlift
                dead_stall = true
            }
            if(bench_stall && dead_stall && squat_stall){
                next_bench = next_bench*0.8
                next_deadlift = next_deadlift*0.8
                next_squat = next_squat*0.8
                variables.defaults.setObject("PNP3", forKey: "CurrentProgram")//proceed to pnp3
            }
        }
            
        else{
            last_deadlift = deadlift_max[0] * 0.78
            last_squat = squat_max[0] * 0.78
            last_bench = bench_max[0] * 0.78
            next_deadlift = last_deadlift
            next_squat = last_squat
            next_bench = last_bench
        }
        variables.defaults.setFloat(next_squat, forKey: "next_squat")
        variables.defaults.setFloat(next_deadlift, forKey: "next_deadlift")
        variables.defaults.setFloat(next_bench, forKey: "next_bench")
        variables.defaults.setFloat(last_squat, forKey: "last_squat")
        variables.defaults.setFloat(last_deadlift, forKey: "last_deadlift")
        variables.defaults.setFloat(last_bench, forKey: "last_bench")
        print("updating pnp2 lifts done")
    }

    
    //func updateReps(){}
    
    
    func getFirstWorkingSet()->set{
        
        var first_set:set
        let program: String = variables.user.curProgram
        
        switch(program){
            case "PNP1": first_set = firstWSForPNP1()
            case "PNP2": first_set = firstWSForPNP1()
            case "PNP3": first_set = firstWSForPNP1()
            case "PIP1": first_set = firstWSForPNP1()
            case "PIP2": first_set = firstWSForPNP1()
            case "PIP3": first_set = firstWSForPNP1()
            default: first_set = firstWSForPNP1()
        }

        return first_set
    }
    
    func firstWSForPNP1()->set{
        let date = NSDate()
        let cal = NSCalendar.currentCalendar()
        let comp = cal.components([.Day, .Month, .Year, .Weekday], fromDate: date)
        let wkday = comp.weekday
        
        var first_set:set
        let weights_to_use:[Float] = [next_squat,next_deadlift,next_deadlift]
        
        
        switch(wkday){
        case 1: first_set = set.init(lift: ["rest"], reps: [0], fatigue: [0], method: "nil", weights: [0], rpe: 0, count: [0])                     //Sunday,rest
        case 2: first_set = set.init(lift: ["squat","bench","deadlift"], reps: [3,6], fatigue: [0], method: "nil", weights: weights_to_use, rpe: 9, count: [2,3,1])                    //Monday
        case 3: first_set = set.init(lift: ["rest"], reps: [0], fatigue: [0], method: "nil", weights: [0], rpe: 0, count: [0])                   //Tuesday,rest
        case 4: first_set = set.init(lift: ["squat","bench","deadlift"], reps: [3,6], fatigue: [0], method: "nil", weights: weights_to_use, rpe: 0, count: [2,3,1])                    //Wednesday
        case 5: first_set = set.init(lift: ["rest"], reps: [0], fatigue: [0], method: "nil", weights: [0], rpe: 0, count: [0])                    //Thursday,rest
        case 6: first_set = set.init(lift: ["squat","bench","deadlift"], reps: [3,6], fatigue: [0], method: "nil", weights: weights_to_use, rpe: 0, count: [2,3,1])                   //Friday
        case 7: first_set = set.init(lift: ["conditioning"], reps: [0], fatigue: [0], method: "nil", weights: [0], rpe: 0, count: [0])                    //Saturday,conditioning
        default: first_set = set.init(lift: ["nil"], reps: [0], fatigue: [0], method: "nil", weights: [0], rpe: 0, count: [0])
        }
        
        return first_set
    }
    
    // to be finished
    
    func firstWSForPNP2(){}
    func firstWSForPNP3(){}
    func firstWSForPIP1(){}
    func firstWSForPIP2(){}
    func firstWSForPIP3(){}
    
    
    
}