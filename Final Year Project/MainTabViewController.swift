//
//  MainTabViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /179/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
   

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tabBarController?.hidesBottomBarWhenPushed
                            variables.defaults.setObject("yes", forKey: "userSet")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
