//
//  Date+Extension.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-28.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation


extension Date
{
    func printable() -> String
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:a"
        
        return dateFormatter.string(from: self)
    }
}

extension TimeInterval
{
    func printable() -> String
    {
      
        return String(stringFromTimeInterval(interval: self))
        
    }
    
    
    func stringFromTimeInterval(interval: TimeInterval) -> NSString {

      let ti = NSInteger(interval)

 


      let minutes = (ti / 60) % 60
      let hours = (ti / 3600)

      return NSString(format: "%0.2d:%0.2d",hours,minutes)
    }
}
