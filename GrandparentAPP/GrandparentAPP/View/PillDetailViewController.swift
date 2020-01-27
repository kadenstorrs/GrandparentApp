//
//  PillDetailViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var ndcNumberLbl: UITextField!
    @IBOutlet weak var dosageTypeLbl: UITextField!
    @IBOutlet weak var endDateLbl: UITextField!
    @IBOutlet weak var productNameLbl: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var circularImage: UIImageView!
    
    var pill: Pill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = circularImage.bounds.width / 2
        
        if let pill = pill {
            ndcNumberLbl.text = pill.ndcNumber
            dosageTypeLbl.text = pill.dosageType
            endDateLbl.text = pill.endDate
            productNameLbl.text = pill.prescription
        }
        updateView()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let prescription = productNameLbl.text ?? ""
        let ndcNumber = ndcNumberLbl.text ?? ""
        let dosageType = dosageTypeLbl.text ?? ""
        let endDate = endDateLbl.text ?? ""
        let imageData = addPhotoButton.backgroundImage(for: .normal)
        
        pill = Pill(prescription: prescription, ndcNumber: ndcNumber, dosageType: dosageType, endDate: endDate, imageData: imageData?.pngData())
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        if let packaging = (segue.source as? SearchMedsTableViewController)?.selectedPackaging {
            ndcNumberLbl.text = packaging.product_ndc
            dosageTypeLbl.text = packaging.dosage_form
            productNameLbl.text = packaging.generic_name
        }
    }
    
    func updateView() {
        guard let pill = pill else { return }
        if let imageData = pill.imageData,
            let image = UIImage(data: imageData) {
            addPhotoButton.setTitle("", for: .normal)
            addPhotoButton.setImage(image, for: .normal)
        } else {
            addPhotoButton.setTitle("Add Photo", for: .normal)
            addPhotoButton.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
