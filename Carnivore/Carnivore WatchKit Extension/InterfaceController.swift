/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var timer: WKInterfaceTimer!
    @IBOutlet var weightLabel: WKInterfaceLabel!
    @IBOutlet var cookLabel: WKInterfaceLabel!
    @IBOutlet var timerButton: WKInterfaceButton!
    
    var ounces = 16
    var cookTemp = MeatTemperature.Medium
    var timerRunning = false
    var usingMetric = false
    
  override func awakeWithContext(context: AnyObject?) {
    super.awakeWithContext(context)
    
    updateConfiguration()
    
  }
    
    func updateConfiguration() {
        
        weightLabel.setText("Weight: \(ounces) oz")
        
        cookLabel.setText(cookTemp.stringValue)
    }

    @IBAction func onTimerButton() {
       
        if timerRunning {
            timer.stop()
            timerButton.setTitle("Start Timer")
        } else {
            
            let time = cookTemp.cookTimeForOunces(ounces)
            timer.setDate(NSDate(timeIntervalSinceNow: time))
            timer.start()
            timerButton.setTitle("Stop Timer")
        }
        
        timerRunning = !timerRunning
}
    
    @IBAction func onMinusButton() {
        
        ounces--
        updateConfiguration()
    }
    
    @IBAction func onPlusButton() {
        
        ounces++
        updateConfiguration()
    }
    
    @IBAction func onTempChange(value: Float) {
        
        if let temp = MeatTemperature(rawValue: Int(value)) {
            cookTemp = temp
            updateConfiguration()
        }
    }
    
    @IBAction func onMetricChanged(value: Bool) {
        
        usingMetric = value
        updateConfiguration()
    }
}
