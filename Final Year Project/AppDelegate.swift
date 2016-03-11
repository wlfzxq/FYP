//
//  AppDelegate.swift
//  Final Year Project
//
//  Created by Wang Longfei on /139/15.
//  Copyright (c) 2015 Wang Longfei. All rights reserved.
//

import UIKit
import CoreData

struct variables {
    static var user = UserDetail()
    static let defaults = NSUserDefaults.standardUserDefaults()
    static let fileManager = NSFileManager.defaultManager()
    static var filePath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    

}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
//    func saveProgram(pro:Programs){
//        variables.defaults.setObject(pro, forKey: pro.key)
//        
//    }
//    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
      
      
      
        if let isFirstLaunch = variables.defaults.stringForKey("userSet"){
           print("not first time")
          //  let np1 = Programs.init(intro: "This is True Novice Program", name: "True Novice", key:"np1")
            //let np2 = Programs.init(intro: "This is Intermediate Novice Program", name: "Intermediate Novice", key:"np2")
            //let np3 = Programs.init(intro: "This is Advanced Novice Program", name: "Advanced Novice", key: "np3")
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
            
            var storyboard = UIStoryboard(name: "Main", bundle: nil)
            
           var initialViewController = storyboard.instantiateViewControllerWithIdentifier("MainView") as! UITabBarController
            //var initialViewController = storyboard.instantiateViewControllerWithIdentifier("settings") as! UIViewController
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            var defaultForExtension:NSUserDefaults! = NSUserDefaults(suiteName: "group.FYPGroup")

            if(defaultForExtension != nil){
                defaultForExtension.setObject(variables.user.curProgram, forKey: "Program")
                defaultForExtension.setFloat(variables.user.bench, forKey: "BenchMax")
                defaultForExtension.setFloat(variables.user.squat, forKey: "SquatMax")
                defaultForExtension.setFloat(variables.user.deadlift, forKey: "DeadliftMax")
                defaultForExtension.synchronize()
                print(defaultForExtension.objectForKey("Program"))
            }

        }
        else{
            print("Virgin")

            }
        

       // return true
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "wlfzxq.ore" in the application's documents Application Support directory.
//        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
//        return urls[urls.count-1]
 return NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier("group.FYPGroup") ?? nil
    }()!
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("ore", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    

    

}

