//
//  PillBoxTableViewCell.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/28/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillBoxTableViewCell: UITableViewCell {
    
    var pill: Pills?
    var checkTapped = false

    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var prescriptionLabel: UILabel!
    @IBOutlet weak var timeOfDayLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with pill: Pills) {
        prescriptionLabel.text = pill.prescription
        timeOfDayLabel.text = pill.timeOfDay
        print("pill: \(pill)")
        if let image = pill.image,
//            let data = image.pngData(),
            let newImageFromData = UIImage(data: image) {
            photoImageView.image = newImageFromData
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
