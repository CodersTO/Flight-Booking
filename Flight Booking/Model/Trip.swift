//
//  File.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-27.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import UIKit

class Trip {

    
    var destination:String
    var arrival:String
    var startTime:String
    var finishTime:String
    var ticketPrice:String
    var route:[String] // ["YYZ","MON","AMS","DEL"]
    var time:String
    var layoverTime:String
    var layoverCount:Int
    var airlineName:String
    
    init(arrival:String, destination:String, startTime:String, finishTime:String, ticketPrice:String, route:[String], time:String, layoverTime:String, layoverCount:Int, airlineName:String )
     {
            
        self.arrival = arrival
        self.destination = destination
        self.startTime = startTime
        self.finishTime = finishTime
        self.ticketPrice = ticketPrice
        self.route = route
        self.time = time
        self.layoverTime = layoverTime
        self.layoverCount = layoverCount
        self.airlineName = airlineName
        
    }
    
    
    
}
