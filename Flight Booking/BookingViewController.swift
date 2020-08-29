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
        
        return cell
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var destinationsArray = UserDefaults.standard.array(forKey: "destinations")
    var arrivalArray = UserDefaults.standard.array(forKey: "arrival")
    var startArray = UserDefaults.standard.array(forKey: "start")
    var endArray = UserDefaults.standard.array(forKey: "end")
    
    override func viewDidLoad() {
        
        
        
        
    }
    
    
}
