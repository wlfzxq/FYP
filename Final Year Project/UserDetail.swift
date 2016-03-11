//
//  UserDetail.swift
//  Final Year Project
//
//  Created by Wang Longfei on /139/15.
//  Copyright (c) 2015 Wang Longfei. All rights reserved.
//

import UIKit

protocol setUserDataDelegate: class {
    func setUserData(controller: UserDetail)
    
}
protocol setUserLiftsDelegate: class {
    func setUserLifts(controller: UserDetail)
    
}
protocol setUserProgramDelegate: class {
    func setUserProgram(controller: UserDetail)
    
}



class UserDetail: AnyObject {
    
    weak var delegate = setUserDataDelegate?()
    weak var liftDelegate = setUserLiftsDelegate?()
    weak var programDelegate = setUserProgramDelegate?()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var name = " "
    var age = 0
    var bench: Float = 0
    var squat:Float = 0
    var deadlift:Float = 0
   // var exp = 0
    var weight: Float = 0
    var curProgram: String = ""
    //var program: programs

    var total: Float{
        get{
             return bench + squat + deadlift
        }
    }
    var level: Int{//performance classification based on https://rawpowerliftingontario.files.wordpress.com/2011/11/raw-powerlifting-classification-standards.pdf
        get{
            if weight<=52 {
                if total<=201{
                    return 0;//beginner
                }
                else if total<=230{
                    return 1;//class4
                }
                else if total<=264{
                    return 2;//class3
                }
                else if total<=300{
                    return 3;//class2
                }
                else if total<=337{
                    return 4;//class1
                }
                else if total<=366{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=56{
                if total<=220{
                    return 0;//beginner
                }
                else if total<=252{
                    return 1;//class4
                }
                else if total<=288{
                    return 2;//class3
                }
                else if total<=328{
                    return 3;//class2
                }
                else if total<=369{
                    return 4;//class1
                }
                else if total<=400{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=60{
                if total<=237{
                    return 0;//beginner
                }
                else if total<=271{
                    return 1;//class4
                }
                else if total<=310{
                    return 2;//class3
                }
                else if total<=353{
                    return 3;//class2
                }
                else if total<=396{
                    return 4;//class1
                }
                else if total<=430{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=67{
                if total<=281{
                    return 0;//beginner
                }
                else if total<=322{
                    return 1;//class4
                }
                else if total<=368{
                    return 2;//class3
                }
                else if total<=419{
                    return 3;//class2
                }
                else if total<=470{
                    return 4;//class1
                }
                else if total<=511{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=75{
                if total<=315{
                    return 0;//beginner
                }
                else if total<=360{
                    return 1;//class4
                }
                else if total<=412{
                    return 2;//class3
                }
                else if total<=470{
                    return 3;//class2
                }
                else if total<=527{
                    return 4;//class1
                }
                else if total<=573{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=82{
                if total<=349{
                    return 0;//beginner
                }
                else if total<=400{
                    return 1;//class4
                }
                else if total<=460{
                    return 2;//class3
                }
                else if total<=522{
                    return 3;//class2
                }
                else if total<=581{
                    return 4;//class1
                }
                else if total<=635{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=90{
                if total<=374{
                    return 0;//beginner
                }
                else if total<=428{
                    return 1;//class4
                }
                else if total<=489{
                    return 2;//class3
                }
                else if total<=557{
                    return 3;//class2
                }
                else if total<=625{
                    return 4;//class1
                }
                else if total<=680{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=100{
                if total<=397{
                    return 0;//beginner
                }
                else if total<=455{
                    return 1;//class4
                }
                else if total<=520{
                    return 2;//class3
                }
                else if total<=591{
                    return 3;//class2
                }
                else if total<=664{
                    return 4;//class1
                }
                else if total<=721{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=110{
                if total<=408{
                    return 0;//beginner
                }
                else if total<=467{
                    return 1;//class4
                }
                else if total<=534{
                    return 2;//class3
                }
                else if total<=608{
                    return 3;//class2
                }
                else if total<=682{
                    return 4;//class1
                }
                else if total<=741{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            else if weight<=125{
                if total<=428{
                    return 0;//beginner
                }
                else if total<=490{
                    return 1;//class4
                }
                else if total<=560{
                    return 2;//class3
                }
                else if total<=637{
                    return 3;//class2
                }
                else if total<=715{
                    return 4;//class1
                }
                else if total<=777{
                    return 5;//master
                }
                else {
                    return 6;//elite
                }
            }
            
            else {
            if total<=435{
                return 0;//beginner
            }
            else if total<=498{
                return 1;//class4
            }
            else if total<=570{
                return 2;//class3
            }
            else if total<=649{
                return 3;//class2
            }
            else if total<=728{
                return 4;//class1
            }
            else if total<=791{
                return 5;//master
            }
            else {
                return 6;//elite
                }
            }
        }
        
    }
    
    var classification: String{
    get{
        switch level{
        case 0: return "beginner"//true novice
        case 1: return "class IV"//intermediate novice
        case 2: return "class III"//Advanced novice
        case 3: return "class II"// intermediate
        case 4: return "class I"//advanced intermediate
        case 5: return "master"
        case 6: return "elite"
        default: return "not defined"
        }
    }
    }
    
    init(){}
    
    init(name: String, age: Int, weight: Float, bench: Float, squat: Float, deadlift: Float, curProgram: String){//, program: programs){
        self.name = name
        self.age = age
        self.bench = bench
        self.squat = squat
        self.deadlift = deadlift
        self.weight = weight
        self.curProgram = curProgram
//        self.program = program
    }
    

}
