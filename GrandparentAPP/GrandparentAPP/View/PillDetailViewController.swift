//
//  PillDetailViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class PillDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    let picker1 = UIDatePicker()
    
    var weekday = [1, 2, 3, 4, 5, 6, 7]
    
    @IBOutlet weak var ndcNumberLbl: UITextField!
    @IBOutlet weak var dosageTypeTxtField: UITextField!
    @IBOutlet weak var perscriptionNameTxtField: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var circularImage: UIImageView!
    @IBOutlet weak var timeofDayTxtField: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
  //notification outlets buttons v
    
    @IBOutlet weak var mBtn: UIButton! // tag value is 2
    @IBOutlet weak var tBtn: UIButton! // tag value is 3
    @IBOutlet weak var wBtn: UIButton! // tag value is 4
    @IBOutlet weak var thBtn: UIButton! // tag value is 5
    @IBOutlet weak var fBtn: UIButton! // tag value is 6
    @IBOutlet weak var saBtn: UIButton! // tag value is 7
    @IBOutlet weak var suBtn: UIButton! // tag value is 1
    
    
    var pill: Pills?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perscriptionNameTxtField.delegate = self
        timeofDayTxtField.delegate = self
        
        if let pillTitle = pill {
                  self.navigationItem.title = pillTitle.prescription
              } else {
                  self.navigationItem.title = "New Perscription"
              }
        
        if self.perscriptionNameTxtField.text!.isEmpty || timeofDayTxtField.text!.isEmpty {
            self.saveBtn.isEnabled = false
        } else {
            self.saveBtn.isEnabled = true
        }
//        if let image = circularImage.image {
//            pill?.image = image.pngData()
//        }
        
//        let image = circularImage.image!
//        let data = image.pngData()!
//        let newImageFromData = UIImage(data: data)
        
        // This lets the user tap on the screen to get the keyboard to go off
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
     
        
        circularImage.layer.masksToBounds = true
        
   
        circularImage.layer.cornerRadius = (circularImage.bounds.width / 2)
        circularImage.layer.borderColor = UIColor(red: 0.42, green: 0.34, blue: 0.48, alpha: 1.0).cgColor
        circularImage.layer.borderWidth = 2.5
        
        
        
        createPickerView()
        createToolbar()
        createToolbar()
        
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        
        
        timeofDayTxtField.delegate = self as? UITextFieldDelegate
        timeofDayTxtField.keyboardType = .numberPad
        
        picker1.addTarget(self, action: #selector(PillDetailViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
       
        
        
        
        
        
        if let pill = pill {
            ndcNumberLbl.text = pill.ndcNumber
            dosageTypeTxtField.text = pill.dosageType
            perscriptionNameTxtField.text = pill.prescription
            timeofDayTxtField.text = pill.timeOfDay
            if let image = circularImage.image {
                pill.image = image.pngData()
            }
        }
        updateView()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

         // Find out what the text field will be after adding the current edit
        let text = (perscriptionNameTxtField.text! as NSString).replacingCharacters(in: range, with: string)

         if !text.isEmpty{//Checking if the input field is not empty
             saveBtn.isEnabled = true //Enabling the button
         } else {
            saveBtn.isEnabled = false //Disabling the button
            perscriptionNameTxtField.placeholder = "Please fill in this field"
         }

         // Return true so the text field will be changed
         return true
     }
    

    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        timeofDayTxtField.text = dateFormatter.string(from: sender.date)
    }
    
    func createPickerView() {
        
        timeofDayTxtField.inputView = picker1
        picker1.backgroundColor = UIColor.lightGray
        picker1.datePickerMode = .time
        
    }
    

    
    

//    @IBAction func daysOfWeekSaved(_ sender: UIButton) {
//        var appleDelegate: AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
//        var context: NSManagedObjectContext = appleDelegate.
//        
//        
//        
//    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        let prescription = perscriptionNameTxtField.text ?? ""
        let ndcNumber = ndcNumberLbl.text ?? ""
        let timeOfDay = timeofDayTxtField.text ?? ""
        let dosageType = dosageTypeTxtField.text ?? ""
        let image = circularImage.image?.pngData()
        let daysToTake = daysSelected()
        
        
        pill = Pills(prescription: prescription, ndcNumber: ndcNumber, timeOfDay: timeOfDay, dosageType: dosageType, image: image, daysToTake: daysToTake)
        
        Stack.saveContext()
        
         performSegue(withIdentifier: "saveUnwind", sender: Any.self)
       
        
    }
    
    @IBAction func dayOfWeekBtnTapped(_ sender: UIButton) {
        

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            if !granted {
                print("Something went wrong")
            } else {
                DispatchQueue.main.async {
                    sender.setImage(UIImage(systemName: "\(String(describing: sender.titleLabel?.text?.first)).square.fill"), for: .normal)
                    let dayOfWeek = (sender as UIButton).tag

                         
                 let content = UNMutableNotificationContent()

                    content.title = "Time to take your medicane"
                    content.body = "Time to take your perscription: \(String(describing: self.perscriptionNameTxtField.text!)), you are scheduled to take \(String(describing: self.perscriptionNameTxtField.text!)))"
                    content.sound = UNNotificationSound.default
                    let calendar = Calendar.current
                    let timeComponents = calendar.dateComponents([.hour, .minute], from: self.picker1.date)
                    var components = DateComponents()
                    components.weekday = dayOfWeek

              
                    let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    center.removeAllPendingNotificationRequests()
                    center.add(request)
                }
            }
        }
    }
    
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor.black
        toolbar.backgroundColor = UIColor.white
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PillDetailViewController.closePickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        timeofDayTxtField.inputAccessoryView = toolbar
    }
    
  
    
    
    @objc func closePickerView() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return picker1.accessibilityElementCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return picker1.accessibilityElementCount()
    }
    
    
    func daysSelected() -> [DaysOfWeek] {
        var selectedDays: [DaysOfWeek] = []
        if suBtn.isSelected {
            selectedDays.append(.sunday)
        }
        if mBtn.isSelected {
            selectedDays.append(.monday)
        }
        if tBtn.isSelected {
            selectedDays.append(.tuesday)
        }
        if wBtn.isSelected {
            selectedDays.append(.wednesday)
        }
        if thBtn.isSelected {
            selectedDays.append(.thursday)
        }
        if fBtn.isSelected {
            selectedDays.append(.friday)
        }
        if saBtn.isSelected {
            selectedDays.append(.saturday)
        }
        return selectedDays
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)

        guard segue.identifier != "toSearch" else { return }

        let prescription = perscriptionNameTxtField.text ?? ""
        let ndcNumber = ndcNumberLbl.text ?? ""
        let timeOfDay = timeofDayTxtField.text ?? ""
        let dosageType = dosageTypeTxtField.text ?? ""
        let image = circularImage.image?.pngData()
        let daysToTake = daysSelected()


        pill = Pills(prescription: prescription, ndcNumber: ndcNumber, timeOfDay: timeOfDay, dosageType: dosageType, image: image, daysToTake: daysToTake)
        PillsController.sharedController.save()

    }

    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        if let packaging = (segue.source as? SearchMedsTableViewController)?.selectedPackaging {
            ndcNumberLbl.text = packaging.product_ndc
            dosageTypeTxtField.text = packaging.dosage_form
            perscriptionNameTxtField.text = packaging.generic_name
//            timeOfDayTxt.text = packaging.timeOfDay
            PillsController.sharedController.save()
        }
    }
    
    func updateView() {
        if let pill = pill {
            if let image = pill.image,
                let newImageFromData = UIImage(data: image) {
                circularImage.image = newImageFromData
                addPhotoButton.setTitle("", for: .normal)
                addPhotoButton.setImage(newImageFromData, for: .normal)
            } else {
                addPhotoButton.setTitle("Add Photo", for: .normal)
                addPhotoButton.setImage(nil, for: .normal)
            }
        }
    }
    
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
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
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            circularImage.image = selectedImage
            if let image = circularImage.image,
                let data = image.pngData(),
                let newImageFromData = UIImage(data: data) {
                addPhotoButton.imageView?.image = newImageFromData
            }
            addPhotoButton.imageView?.image = selectedImage
            pill?.image = selectedImage.pngData()
            addPhotoButton.imageView?.image = selectedImage
            dismiss(animated: true) {
//                self.updateView()
                print("view updated")
            }
            
        }
    }
    
    @IBAction func ndcInfoButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "National Drug Code", message: "A unique 10-digit or 11-digit, 3-segment number, and a universal product identifier for human drugs in the United States."
            ,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true,  completion: nil)
    }
    
    @IBAction func dosageTypeInfoButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Dosage Type", message: "The physical form of a dose of a chemical compound used as medication intended for consumption. Common dosage forms include pill, tablet, or capsule."
            ,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true,  completion: nil)
    }
    
}

