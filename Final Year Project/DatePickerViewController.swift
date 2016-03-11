//
//  DatePickerViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /179/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    var startDate: NSDate?;
    
    override func viewWillAppear(animated: Bool) {
        self.setLabelWidth(titleLabel)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }




    
    @IBAction func saveDate(sender: AnyObject) {
        startDate = dataPicker.date
        print(startDate);
        variables.defaults.setObject(startDate, forKey: "startDate")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func setLabelWidth(label: UILabel){
        label.numberOfLines = 2
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
