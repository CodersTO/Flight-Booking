//
//  FlightViewController.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-25.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import UIKit

class FlightViewController: UIViewController, UITableViewDelegate , UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    var fromAirportCode:String!
    var toAirportCode:String!
    var indexSelected = 0
    var departureDate:Date!
    var returnDate:Date!
    
    
    var trips:[Trip] = [Trip]()
    
    
    //var cellHeights = (0..<self.trips.count).map { _ in C.CellHeight.close }
   
    @IBAction func bookFlight(_ sender: Any) {
        // Create the AlertController
        let actionSheetController = UIAlertController(title: "Confirmation", message: "Confirm Booking?", preferredStyle: .actionSheet)

        // Create and add the Cancel action
        let confirmNo = UIAlertAction(title: "No", style: .cancel) { action -> Void in
            // Just dismiss the action sheet
        }
        actionSheetController.addAction(confirmNo)

        let confirmYes = UIAlertAction(title: "Yes", style: .default) { action -> Void in
            
            //save all data to UserDefaults
            //for destinations
            
            var destinations = UserDefaults.standard.array(forKey: "destinations") ?? [String]()
            destinations.append(self.trips[self.indexSelected].destination)
            UserDefaults.standard.setValue(destinations, forKey: "destinations")
            print(self.trips[self.indexSelected].destination)
            
            var arrival = UserDefaults.standard.array(forKey: "arrival") ?? [String]()
            arrival.append(self.trips[self.indexSelected].arrival)
            UserDefaults.standard.setValue(arrival, forKey: "arrival")
            print(self.trips[self.indexSelected].destination)
            
            var start = UserDefaults.standard.array(forKey: "start") ?? [Date]()
            start.append(self.trips[self.indexSelected].startTime)
            UserDefaults.standard.setValue(start, forKey: "start")
            
            var end = UserDefaults.standard.array(forKey: "end") ?? [Date]()
            end.append(self.trips[self.indexSelected].finishTime)
            UserDefaults.standard.setValue(end, forKey: "end")
            
            // Further
            
            
            
            
            
            let alert = UIAlertController(title: "Done", message: "Do you want to book more flights ?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "YES", style: .default, handler: nil)
            let noAction = UIAlertAction(title: "NO", style: .destructive, handler: {
                action in
                
                self.navigationController?.popViewController(animated: true)
                
            })
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            self.present(alert, animated: true)
            
        }
        actionSheetController.addAction(confirmYes)

       

        // Present the AlertController
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        //print("Row selected: \(indexSelected)")
    }
    override func viewDidLoad() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        FlightAPI.fetchFromNetwork(destination: fromAirportCode!, arrival: toAirportCode!, onCompletion: {
            
            data in
            
            self.trips = data
            
            
            self.tableView.reloadData()
            self.tableView.isHidden  = false
                  self.indicator.isHidden = true
            
           
        }
        )
            //do the shit here.
        
        
 
        
        
    }
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidAppear(_ animated: Bool) {
          self.tableView.reloadData()
        
        labelMain.text = "FROM \(fromAirportCode!) TO \(toAirportCode!)"
        
        //self.tableView.separatorColor = .clear
        
        self.tableView.isHidden  = true
        self.indicator.isHidden = false
        
        
      }
      
    
    @IBOutlet weak var labelMain: UILabel!
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 234
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count;
       }
    

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
            
        
        let trip = trips[indexPath.item]
        
        cell.labelArrival.text = trip.arrival

        cell.labelPrice.text = trip.ticketPrice.currency()
        cell.labelStartTime.text = "Start Time: "+trip.startTime.printable()
        cell.labelFinishTime.text = "Finish Time: "+trip.finishTime.printable()

        cell.labelDestination.text = trip.destination
      //  cell.labelRoute.text = "\(trip.destination), \(trip.arrival)"
        cell.labelTotalTime.text = "Total Time: "+trip.time.printable()+" hrs"
       
        
        
        
        
           return cell;

       }
    
    

    
    
}
