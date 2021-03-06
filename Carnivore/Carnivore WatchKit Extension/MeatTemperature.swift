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

import Foundation

enum MeatTemperature: Int {
  case Rare = 0, MediumRare, Medium, WellDone

  var stringValue: String {
    let temperatures = ["Rare", "Medium Rare", "Medium", "Well Done"]
      return temperatures[self.rawValue]
  }

  var timeModifier: Double {
    let modifiers = [0.5, 0.75, 1.0, 1.5]
    return modifiers[self.rawValue]
  }

  func cookTimeForOunces(ounces: Int) -> NSTimeInterval {
    let baseTime: NSTimeInterval = 47 * 60
    let baseWeight = 16
    let weightModifier: Double =
    Double(ounces) / Double(baseWeight)
    let tempModifier = self.timeModifier
    return baseTime * weightModifier * tempModifier
  }
}
