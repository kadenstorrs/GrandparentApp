//
//  PillBoxTableViewCell.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/28/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillBoxTableViewCell: UITableViewCell {
    
    var pill: Pill?
    var checkTapped = false

    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var prescriptionLabel: UILabel!
    @IBOutlet weak var timeOfDayLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with pill: Pill) {
        prescriptionLabel.text = pill.prescription
        timeOfDayLabel.text = pill.timeOfDay
        if let photo = pill.imageData {
            photoImageView.image = UIImage(data: photo)
        }
    }
    
    @IBAction func checkMarkButtonTapped(_ sender: Any) {
        if self.checkTapped == false {
            checkMarkButton.setImage(UIImage(named: "checkCircle"), for: .normal)
            self.checkTapped = true
        } else {
            checkMarkButton.setImage(UIImage(named: "emptyCircle"), for: .normal)
            self.checkTapped = false
        }
    }
    
}
