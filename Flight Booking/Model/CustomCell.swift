//
//  CustomCell.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-28.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import UIKit

class CustomCell : UITableViewCell
{

    
    @IBOutlet weak var labelDestination: UILabel!
    
    @IBOutlet weak var labelArrival: UILabel!
    
    @IBOutlet weak var labelPrice: UILabel!

    @IBOutlet weak var labelStartTime: UILabel!
    
    @IBOutlet weak var labelTotalTime: UILabel!
    
    @IBOutlet weak var labelFinishTime: UILabel!
    
    @IBAction func bookFlight(_ sender: UIButton) {
        
        
        
    }
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
    
    
}
