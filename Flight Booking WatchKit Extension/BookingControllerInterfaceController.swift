//
//  BookingControllerInterfaceController.swift
//  Flight Booking WatchKit Extension
//
//  Created by Kishore Narang on 2020-08-30.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class BookingControllerInterfaceController: WKInterfaceController{
    
 
    
  

    
    
    @IBOutlet weak var myTable: WKInterfaceTable!
    var destinations:[String]?
    var arrival:[String]?
    var dateTime:[Date]?
    
    
    override init()
    {
        super.init()
        loadTable()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        print("HELLO FROM AWAKE")
      
        let controller = context as! InterfaceController
        
//        destinations = controller.message!["destinations"] as! [String]
//        arrival = controller.message!["arrival"] as! [String]
//        dateTime = controller.message!["dateTime"] as! [Date]
        
        
        
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        
        destinations = ["ATQ","DEL","BOM"]
        arrival = ["DEL","BOM","ATQ"]
        dateTime = [Date(timeInterval: -6000, since: Date()), Date(timeInterval: 6000, since: Date()), Date(timeInterval: 9000, since: Date())]
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    func loadTable()
    {
        
        destinations = ["ATQ","DEL","BOM"]
        arrival = ["DEL","BOM","ATQ"]
        dateTime = [Date(timeInterval: -6000, since: Date()), Date(timeInterval: 6000, since: Date()), Date(timeInterval: 9000, since: Date())]
        
        
        myTable.setNumberOfRows(destinations!.count, withRowType: "MyRowController")
        print(destinations!.count)
        for (index,labelText) in destinations!.enumerated()
        {
            print("creating row")
            
            let row = myTable.rowController(at: index) as! RowController
            
            row.destination.setText(destinations![index])
            row.arrival.setText(arrival![index])
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd hh:MM:ss a"
            row.dateTime.setText(df.string(from: dateTime![index]))
        }
    }

}
