//
//  FlightViewController.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import UIKit

class FlightViewController:UIViewController
{
    
    
    var fromAirportCode:String!
    var toAirportCode:String!
    
    var departureDate:Date!
    var returnDate:Date!
    
    @IBOutlet weak var labelLayoverTime: UILabel!
    @IBOutlet weak var labelTotalTime: UILabel!
    @IBOutlet weak var labelRoute: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDestinationAbbr: UILabel!
    @IBOutlet weak var labelArriavalAbbr: UILabel!
    @IBOutlet weak var labelStartTime: UILabel!
    @IBOutlet weak var labelFinishTime: UILabel!
    
    
    
    
    override func viewDidLoad() {
        
       
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
      
        
        FlightAPI.fetchFromNetwork(destination: fromAirportCode!, arrival: toAirportCode!, onDate:dateFormatter.string(from: departureDate) )
            //do the shit here. 
    }
}
