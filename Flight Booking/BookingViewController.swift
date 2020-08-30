//
//  BookingViewController.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-28.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import UIKit


class BookingViewController: UIViewController , UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return destinationsArray!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellBooking") as! BookingCell
        
        
        
        cell.destinationOutlet.text = destinationsArray![indexPath.item] as! String
        
        cell.arrivalOutlet.text = arrivalArray![indexPath.item] as! String
        
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss a"
        
        
        cell.finishTime.text = df.string(from: endArray![indexPath.item] as! Date)
        cell.startTime.text = df.string(from: startArray![indexPath.item] as! Date)
        
        
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var destinationsArray = UserDefaults.standard.array(forKey: "destinations")
    var arrivalArray = UserDefaults.standard.array(forKey: "arrival")
    var startArray = UserDefaults.standard.array(forKey: "start")
    var endArray = UserDefaults.standard.array(forKey: "end")
    
    override func viewDidLoad() {
        
        
        print("Entered in Bookings")
        print(UserDefaults.standard.dictionaryRepresentation())
        
        UserDefaults.standard.removeObject(forKey: "destinations")
        
        UserDefaults.standard.removeObject(forKey: "arrival")
        
        UserDefaults.standard.removeObject(forKey: "start")
        
        
        UserDefaults.standard.removeObject(forKey: "end")
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
}
