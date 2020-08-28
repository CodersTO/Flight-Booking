//
//  String+Extension.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-28.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation

extension String
{
    func currency() -> String
    {
        if var num = Int(self)
        {
            var returner = ""
            var count = 0;
            while(num>0)
            {
                if(count==2 && num>10)
                {
                    returner = ",\(num%10)"+returner
                    count = 0
                }
                else
                {
                    returner = "\(num%10)"+returner
                    count += 1
                }
                num = num/10
            }
            
            return "$\(returner).00"
        }
        else
        
        {
            return self
        }
    }
}
