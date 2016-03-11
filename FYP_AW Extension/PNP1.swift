//
//  PNP1.swift
//  Final Year Project
//
//  Created by Wang Longfei on /103/16.
//  Copyright © 2016 Wang Longfei. All rights reserved.
//
protocol PNP1DidOneSetDelegate:class{
    func didOneSet(controller:PNP1)
}

import Foundation

class PNP1{
    
    var S_set:Int = 1;
    var B_set:Int = 1;
    var D_set:Int = 1;
    
    var S_total = 2;
    var B_total = 3;
    var D_total = 1;
    
    var currentLift = 0;
    
    weak var didOneSetDelegate = PNP1DidOneSetDelegate?()
    
    
    
    init(){
    }
    
//    func didOneSet(){
//        print("enter didOneSet")
//        if(currentLift == 0){//doing squat
//            if(S_set != 2){
//                print("increasing 1")
//                S_set++
//            }else{
//                S_set = 1
//                print("increasing 2")
//                currentLift++
//            }
//        }
//        else if(currentLift == 1){//doing bench
//            if(B_set != 3){
//                B_set++
//            }else{
//                B_set = 1
//                currentLift++
//            }
//        }
//        else if(currentLift == 2){
//            if(D_set != 1){
//                D_set++
//            }else{
//                D_set = 1
//                currentLift++
//            }
//        }
//    }
    
    func getCurrentLift() ->Int{
        return currentLift;
    }
    
    func getRemainSet(lift:Int)->Int{
        switch(lift){
        case 0: return S_set
        case 1: return B_set
        case 2: return D_set
        default: return -1
        }
    }
    func getTotalSet(lift:Int)->Int{
        switch(lift){
        case 0: return S_total
        case 1: return B_total
        case 2: return D_total
        default: return 0
        }
    }
}