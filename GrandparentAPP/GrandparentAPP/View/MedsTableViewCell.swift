//
//  MedsTableViewCell.swift
//  PillBoxView
//
//  Created by Kaden Storrs on 1/21/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class MedsTableViewCell: UITableViewCell {
    @IBOutlet weak var brandNameLbl: UILabel!
    @IBOutlet weak var strengthLbl: UILabel!
    @IBOutlet weak var productNDCLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

}
