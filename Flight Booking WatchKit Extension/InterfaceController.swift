//
//  InterfaceController.swift
//  Flight Booking WatchKit Extension
//
//  Created by Kishore Narang on 2020-08-24.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController , WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("Receiving messages")
        print(message)
        self.message = message
    }
    
    
    
    
    var message:[String:Any]?

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if(WCSession.isSupported())
              {
                  WCSession.default.delegate = self
                  WCSession.default.activate()
                print("Lag gayi")
              }
        else
        {
            print("Session not availablke")
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func onClick() {
        
        
        pushController(withName: "BookedFlights", context: self)
        
        
        
    }
    
    
    
    
    
    
   
    

}
