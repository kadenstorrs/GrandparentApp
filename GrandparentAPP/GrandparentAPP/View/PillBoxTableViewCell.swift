//
//  PillBoxTableViewCell.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/28/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillBoxTableViewCell: UITableViewCell {

    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var prescriptionLabel: UILabel!
    @IBOutlet weak var timeOfDayLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    var checkMarkButtonTapped: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let image = UIImage(systemName: "square")
        checkMarkButton.setImage(image, for: .normal)
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.clipsToBounds = true
        checkMarkButton.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
//        checkMarkButton.setImage(UIImage(systemName: "square"), for: .normal)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    func update(with pill: Pills) {
        prescriptionLabel.text = pill.prescription
        timeOfDayLabel.text = pill.timeOfDay
        if let image = pill.image,
            let newImageFromData = UIImage(data: image) {
            photoImageView.image = newImageFromData
        }
    }
    
    @IBAction func checkMarkButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        checkMarkButtonTapped?(sender.isSelected)
        
    //
//        if pill?.checkMark == false {
//
//            checkMarkButton.setImage(checkCircle, for: UIControl.State.normal)
//            pill?.checkMark = true
//        } else {
//
//            checkMarkButton.setImage(emptyCircle, for: UIControl.State.normal)
//            pill?.checkMark = false
//        }
    }
    
}
