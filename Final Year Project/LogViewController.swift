//
//  LogViewController.swift
//  Final Year Project
//
//  Created by Wang Longfei on /229/15.
//  Copyright © 2015 Wang Longfei. All rights reserved.
//

import UIKit
import WatchConnectivity
import Charts

class LogViewController: UIViewController,UIScrollViewDelegate, WCSessionDelegate{

//    @IBOutlet weak var barChartView: BarChartView!
   
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var lineChartView: LineChartView!
   // @IBOutlet weak var test: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    
    var reps4lifts: [String:Int] = ["lift":0, "reps":0]//0-sq, 1-bp, 2-dl, 3-psq, 4-.....to be continued
  //  var repsDone:[Int] = []
    var session: WCSession!
    
    override func viewDidLoad() {
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self;
            session.activateSession()
        }

        super.viewDidLoad()
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(months, values: unitsSold)
    
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
    }
    
        func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
            let receivedRep = applicationContext["rep"] as! Int
            let receivedLiftForTheRep = applicationContext["lift"] as! Int
            
            if(receivedRep != -1 && receivedLiftForTheRep != -1){
            print("received a rep count: " + String(receivedRep) + " for lift " + String(receivedLiftForTheRep))
            dispatch_async(dispatch_get_main_queue()) {
               // self.repsDone.append(receivedRep)
               self.reps4lifts.updateValue(receivedLiftForTheRep, forKey: "lift")
                self.reps4lifts.updateValue(receivedRep, forKey: "reps")
                if (receivedLiftForTheRep == 0) {
                    variables.core_data.last_squat_reps = receivedRep
                    variables.defaults.setInteger(receivedRep, forKey: "last_squat_rep")
                }else if(receivedLiftForTheRep == 1 ){
                    variables.core_data.last_bench_reps = receivedRep
                    variables.defaults.setInteger(receivedRep, forKey: "last_bench_rep")
                }else if(receivedLiftForTheRep == 2){
                    variables.core_data.last_deadlift_reps = receivedRep
                    variables.defaults.setInteger(receivedRep, forKey: "last_deadlift_rep")
                }
                
                }
            }else{
                variables.core_data.updateLastLifts()
            }
        }
    
    
    
    var months:[String]!

    func setChart(dataPoints: [String], values: [Double]) {
//        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [ChartDataEntry] = []
        
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)

            dataEntries.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
        let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
//        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Units Sold")
//        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
//        barChartView.data = chartData
        print("1")
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        print("2")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        print("3")
        lineChartView.data = lineChartData
        
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
