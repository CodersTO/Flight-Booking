//
//  CustomCell.swift
//  Flight Booking
//
//  Created by Kishore Narang on 2020-08-28.
//  Copyright © 2020 Kishore Narang. All rights reserved.
//

import Foundation
import FoldingCell

class CustomCell : FoldingCell
{
    @IBOutlet weak var startLBL: UILabel!
    @IBOutlet weak var endLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    @IBOutlet weak var routeLBL: UILabel!
    @IBOutlet weak var timeLBL: UILabel!
    @IBOutlet weak var layoveLBL: UILabel!
    @IBOutlet weak var startTimeLBL: UILabel!
    @IBOutlet weak var finishTimeLBL: UILabel!
    @IBOutlet weak var bookFlightBTN: UIButton!
    
    
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
}
