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

class FlightAPI
{
    
    fileprivate static var API_KEY = "187443b46142e92708e290519f68e983"
    fileprivate static var URL_FOR_FLIGHT_SEARCH = "http://api.aviationstack.com/v1/flights"
    static func fetchFromNetwork(destination:String, arrival:String, onDate:String)
    {
        
        let parameters = ["access_key":API_KEY,
                          "dep_iata":destination,
                          "arr_iata":arrival,
                       
                       ]
        
        
        print(parameters)
        
        
        let request = AF.request(URL_FOR_FLIGHT_SEARCH, parameters: parameters)
        
        request.responseJSON{
            
            (data) in
            
            
            
            do{
                let json = try JSON(data:data.data!)
                
                print(json)
                //hahaha
                
                
                let data = json["data"]
                
                
                
                
                
            }
            catch
            {
                print("Error in parsing json. Check your json")
                //json parsing error.
            }
        }
        
        
        
        
    }
}
