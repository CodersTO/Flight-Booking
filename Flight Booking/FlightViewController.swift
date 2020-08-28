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
    
    fileprivate struct C {
      struct CellHeight {
        static let close: CGFloat = 64 // equal or greater foregroundView height
        static let open: CGFloat = 310 // equal or greater containerView height
      }
    }
    
//    var cellHeights = (0..<10).map { _ in C.CellHeight.close }
    
    var fromAirportCode:String!
    var toAirportCode:String!
    
    var departureDate:Date!
    var returnDate:Date!
    
    override func viewDidLoad() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
//        FlightAPI.fetchFromNetwork(destination: fromAirportCode!, arrival: toAirportCode!, onDate:dateFormatter.string(from: departureDate) )
            //do the shit here. 
    }
    override func viewDidAppear(_ animated: Bool) {
          self.tableView.reloadData()
      }
      
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
       }
    

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
           cell.priceLBL.text = "asd"
           return cell;

       }
       
}
