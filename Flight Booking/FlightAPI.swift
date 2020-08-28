//
//  API.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-27.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

import UIKit

class FlightAPI
{
    
    fileprivate static var API_KEY = "187443b46142e92708e290519f68e983"
    fileprivate static var URL_FOR_FLIGHT_SEARCH = "http://api.aviationstack.com/v1/flights"
    static func fetchFromNetwork(destination:String, arrival:String, onDate:String)
    {
        
        
         let group = DispatchGroup()
        let parameters = ["access_key":API_KEY,
                          "dep_iata":destination,
                          "arr_iata":arrival,
                       
                       ]
        
        
        print(parameters)
        var trips = [Trip]()
        group.enter()
        let request = AF.request(URL_FOR_FLIGHT_SEARCH, parameters: parameters)
        
        request.responseJSON{
            
            (data) in
            
            
            
            do{
                let json = try JSON(data:data.data!)
                
        
                //hahaha
                
                
                let data = json["data"]
                
              
              
     
                DispatchQueue.main.async {
                    
                    
                    
                    
                                   for (key,tripObject) in data
                                   {
                                       let airlineName = tripObject["airline"]["name"].stringValue
                                       let startTime = tripObject["departure"]["actual"].stringValue
                                       
                                       let finishTime = tripObject["arrival"]["actual"].stringValue
                                       

                                       if(startTime == "" || finishTime == "")
                                       {
                                           //error in date. date not found.
                                       }
                                       else
                                       {
                                           let isoStart = startTime.prefix(19)
                                                        let isoFinish = finishTime.prefix(19)
                                                      let formatter = ISO8601DateFormatter()
                                                      formatter.formatOptions =  [.withInternetDateTime, .withFractionalSeconds]
                                                        
                                                        
                                                        let startDate = formatter.date(from: String(isoStart)+".000Z")
                                                        
                                                        let finishDate = formatter.date(from: String(isoFinish)+".000Z")
                                                        
                                                                
                                                        let trip = Trip(arrival: arrival, destination: destination, startTime: startTime, finishTime: finishTime, ticketPrice: ticketPriceCalculator(from: startDate!, to:finishDate!), route: [], time: "", layoverTime: "", layoverCount: 0, airlineName: airlineName)
                                           print(trip)
                                           trips.append(trip)
                                       }
                                       
                                   }
                    
                    
              
                    
                    
                }
                
                
                group.leave()
                
                
                
                
                
                
            }
            catch
            {
                print("Error in parsing json. Check your json")
                //json parsing error.
            }
        }
        
        
        func ticketPriceCalculator(from:Date, to:Date) -> String
        {
            
           
            let date = from.distance(to: to)
            
            
            
            return "\(Int(date*0.03))".currency()
        }
        
        
        
        group.notify(queue: .main)
        {
            print(trips)
           //FUCK YOU
            
            UIApplication.shared.delegate.trips = trips
            
            
            
        }
        
        print("Function REturned to main")
   
        
       
    }
    
    
           
}
