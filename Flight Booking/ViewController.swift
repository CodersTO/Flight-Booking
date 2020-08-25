//
//  ViewController.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-24.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import UIKit
import SearchTextField
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelReturnDate.isHidden = true
        textfieldReturnDate.isHidden = true
    }
    
    
    //Variables or properties.
    
    @IBOutlet weak var labelReturnDate: UILabel!
    @IBOutlet weak var textfieldReturnDate: UITextField!
    let URL_FOR_AIRPORT_CODES_API = "https://www.air-port-codes.com/api/v1/autocomplete"
    let API_KEY = "f2ef71dfd4"
    let API_SECRET = "3245382b046be2b"
    
    
    
    // Selects if the trip is one way or two way(Return trip)
    @IBAction func segmentedControlChooseTripType(_ sender: UISegmentedControl) {
        
        if(sender.selectedSegmentIndex==1)
        {
            labelReturnDate.isHidden = false
            textfieldReturnDate.isHidden = false
        }
        else
        {
            labelReturnDate.isHidden = true
            textfieldReturnDate.isHidden = true
        }
    }
    
    
    
    //Textfields for AIRPORT SEARCH.
    
    @IBAction func searchTextFieldFromLocation(_ sender: SearchTextField) {
        
        
        
        
        sender.theme.font = UIFont.systemFont(ofSize: 12)
        sender.theme.bgColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.95)
        sender.theme.borderColor = .systemBlue
        sender.theme.separatorColor = .systemBlue
        sender.theme.cellHeight = 50
        
        
        
        
        let headers = HTTPHeaders(["APC-Auth":API_KEY, "APC-Auth-Secret":API_SECRET])
        let parameters = ["term":sender.text!]
        
        let request = AF.request(URL_FOR_AIRPORT_CODES_API, method:.post, parameters: parameters, headers: headers)
       
        request.responseJSON{
            data in
            
            do{
                
                var stringOfAirports = [SearchTextFieldItem]()
                let json = try JSON(data:data.data!)
                           print(json)
                let airports = json["airports"]
                
                for (_,airport) in airports{
                    
                    let airportName = airport["iata"].stringValue + " - " + airport["city"].stringValue + " (" + airport["name"].stringValue + ")"
                    
                    let item = SearchTextFieldItem(title: airportName)
                    
                    stringOfAirports.append(item)
                    
                    
                    
                    
                }
                
                sender.filterItems(stringOfAirports)
                
            }
            catch{
                print("Error in Parsing JSON")
            }
        }
    }
    @IBAction func searchTextFieldToLocation(_ sender: SearchTextField) {
        
        

         
         sender.theme.font = UIFont.systemFont(ofSize: 12)
         sender.theme.bgColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.95)
         sender.theme.borderColor = .systemBlue
         sender.theme.separatorColor = .systemBlue
         sender.theme.cellHeight = 50
         
         
         
         
         let headers = HTTPHeaders(["APC-Auth":API_KEY, "APC-Auth-Secret":API_SECRET])
         let parameters = ["term":sender.text!]
         
         let request = AF.request(URL_FOR_AIRPORT_CODES_API, method:.post, parameters: parameters, headers: headers)
        
         request.responseJSON{
             data in
             
             do{
                 
                 var stringOfAirports = [SearchTextFieldItem]()
                 let json = try JSON(data:data.data!)
                            print(json)
                 let airports = json["airports"]
                 
                 for (_,airport) in airports{
                     
                     let airportName = airport["iata"].stringValue + " - " + airport["city"].stringValue + " (" + airport["name"].stringValue + ")"
                     
                     let item = SearchTextFieldItem(title: airportName)
                     
                     stringOfAirports.append(item)
                     
                     
                     
                     
                 }
                 
                 sender.filterItems(stringOfAirports)
                 
             }
             catch{
                 print("Error in Parsing JSON")
             }
         }
        
    }
}
    


