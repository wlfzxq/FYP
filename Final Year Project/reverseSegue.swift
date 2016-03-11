//
//  reverseSegue.swift
//  Final Year Project
//
//  Created by Wang Longfei on /149/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit

class reverseSegue: UIStoryboardSegue {

    override func perform() {
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        
        let firstVCView = self.sourceViewController.view //as UIView!
        
        let secondVCView = self.destinationViewController.view// as UIView!
       
        

        
        
                if self.destinationViewController.title == "You" || self.sourceViewController.title == "Recommendation" {
                        secondVCView.frame = CGRectMake(-screenWidth, 0.0, screenWidth, screenHeight)
                        let window = UIApplication.sharedApplication().keyWindow
                        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
                        UIView.animateWithDuration(0.4, animations: { () -> Void in
                        firstVCView.frame = CGRectOffset(firstVCView.frame, screenWidth, 0.0)
                        secondVCView.frame = CGRectOffset(secondVCView.frame, screenWidth, 0.0)
                            
                                }) { (Finished) -> Void in
                                    self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false,completion: nil)
                                    }
                        }

        
                else{
                    secondVCView.frame = CGRectMake(screenWidth, 0.0, screenWidth, screenHeight)
                    let window = UIApplication.sharedApplication().keyWindow
                    window?.insertSubview(secondVCView, aboveSubview: firstVCView)
                    UIView.animateWithDuration(0.4, animations: { () -> Void in
                        firstVCView.frame = CGRectOffset(firstVCView.frame, -screenWidth, 0.0)
                        secondVCView.frame = CGRectOffset(secondVCView.frame, -screenWidth, 0.0)
                        
                        }) { (Finished) -> Void in
                            self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false,completion: nil)
                    }

        }
    }

    
}
