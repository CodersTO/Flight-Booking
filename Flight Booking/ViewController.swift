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
        
        
        textfieldDepartureDate.setInputViewDatePicker(target: self, selector: #selector(tapDoneOnDepartureDate))
        textfieldReturnDate.setInputViewDatePicker(target: self, selector: #selector(tapDoneOnReturnDate))
    }
    
    
    //Variables or properties.
    
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var searchTextFieldToAirport: SearchTextField!
    @IBOutlet weak var searchTexeFieldFromAirport: SearchTextField!
    @IBOutlet weak var textfieldDepartureDate: UITextField!
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
    
    @IBAction func buttonSearchFlights(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let flightController = storyboard.instantiateViewController(identifier: "flightController") as FlightViewController
        
        
        let fromAirport = searchTexeFieldFromAirport.text!
        let toAirport = searchTextFieldToAirport.text!
        
        let departureDate = textfieldDepartureDate.text!
        let returnDate = textfieldReturnDate.text!
        
        let isOneWay = segmentedControlOutlet.selectedSegmentIndex == 0
        print("CLICK BUTTON")
        if(validate(fromAirport, toAirport, departureDate, returnDate,isOneWay ))
        {
            
            let df = DateFormatter()
            df.dateFormat = "dd-MM-yyyy"
            
            flightController.departureDate = df.date(from: departureDate)
            
            
            
            flightController.fromAirportCode = String(fromAirport.prefix(3))
            flightController.toAirportCode = String(toAirport.prefix(3))
            
            
            if(returnDate != "")
            {
                flightController.returnDate = df.date(from: returnDate)
            }
            
          
            self.navigationController?.pushViewController(flightController, animated: true)
        }
        
        
       
        
        
        
        
        
    }
    
    
    
    func validate(_ from:String, _ to:String, _ departure:String, _ returnDate:String, _ isOneWay:Bool) -> Bool
    {
        
        var returner = true
        let alert = UIAlertController(title: "Error", message: "Message to be discuss later", preferredStyle: .alert)
        
        if(from == "")
        {
            alert.message = "Please Enter Where are you boarding from."
            returner = false
        }
        else if(to == "")
        {
            alert.message = "Please enter your destination."
            returner = false
        }
        else if(departure == "")
        {
            alert.message = "Choose the date of departure"
            returner = false
        }
        else if(!isOneWay && returnDate == "")
        {
            alert.message = "Please enter the return date"
        }
        if(returner==false)
        {
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        return returner
    }
    
    
    
    @objc func tapDoneOnDepartureDate()
    {
        if let datePicker = self.textfieldDepartureDate.inputView as? UIDatePicker { // 2-1
                  let dateformatter = DateFormatter() // 2-2
            dateformatter.dateFormat = "dd-MM-yyyy"// 2-3
                  self.textfieldDepartureDate.text = dateformatter.string(from: datePicker.date) //2-4
              }
              self.textfieldDepartureDate.resignFirstResponder() // 2-5
          
    }
    @objc func tapDoneOnReturnDate()
       {
           if let datePicker = self.textfieldReturnDate.inputView as? UIDatePicker { // 2-1
                     let dateformatter = DateFormatter() // 2-2
               dateformatter.dateFormat = "dd-MM-yyyy"// 2-3
                     self.textfieldReturnDate.text = dateformatter.string(from: datePicker.date) //2-4
                 }
                 self.textfieldReturnDate.resignFirstResponder() // 2-5
             
       }
}
    


