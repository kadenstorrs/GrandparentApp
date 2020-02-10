//
//  PillDetailViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit
import UserNotifications

class PillDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker1 = UIDatePicker()
    let picker2 = UIDatePicker()
    var weekday = [1, 2, 3, 4, 5, 6, 7]
    
    @IBOutlet weak var ndcNumberLbl: UITextField!
    @IBOutlet weak var dosageTypeLbl: UITextField!
    @IBOutlet weak var endDay: UITextField!
    @IBOutlet weak var productNameLbl: UITextField!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var circularImage: UIImageView!
    @IBOutlet weak var timeOfDayTxt: UITextField!
    
    //Buttons for the days of the week
    @IBOutlet weak var mBtn: UIButton! // tag value is 2
    @IBOutlet weak var tBtn: UIButton! // tag value is 3
    @IBOutlet weak var wBtn: UIButton! // tag value is 4
    @IBOutlet weak var thBtn: UIButton! // tag value is 5
    @IBOutlet weak var fBtn: UIButton! // tag value is 6
    @IBOutlet weak var saBtn: UIButton! // tag value is 7
    @IBOutlet weak var suBtn: UIButton! // tag value is 1
    
    

    
    var pill: Pill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This lets the user tap on the screen to get the keyboard to go off
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
     
        
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = (circularImage.bounds.width / 2)
        
        createPickerView()
        createToolbar()
        createpickerView2()
        createToolbar()
        
        UIApplication.shared.sendAction(#selector(UIApplication.resignFirstResponder), to: nil, from: nil, for: nil)
        
        
        timeOfDayTxt.delegate = self as? UITextFieldDelegate
        timeOfDayTxt.keyboardType = .numberPad
        picker2.addTarget(self, action: #selector(PillDetailViewController.datePickerChanged2), for: UIControl.Event.valueChanged)
        picker1.addTarget(self, action: #selector(PillDetailViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
       
        endDay.delegate = self as? UITextFieldDelegate
        picker2.addTarget(self, action: #selector(PillDetailViewController.datePickerChanged2), for: UIControl.Event.valueChanged)
        
        
        
        if let pill = pill {
            ndcNumberLbl.text = pill.ndcNumber
            dosageTypeLbl.text = pill.dosageType
            endDay.text = pill.endDate
            productNameLbl.text = pill.prescription
           
        }
        updateView()
        
    }
    

    @objc func datePickerChanged2(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        endDay.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.amSymbol = "a"
        dateFormatter.pmSymbol = "p"
        timeOfDayTxt.text = dateFormatter.string(from: sender.date)
    }
    
    func createPickerView() {
        
        timeOfDayTxt.inputView = picker1
        picker1.backgroundColor = UIColor.lightGray
        picker1.datePickerMode = .time
        
    }
    
    func createpickerView2() {
        
          endDay.inputView = picker2
          picker2.backgroundColor = UIColor.lightGray
          picker2.datePickerMode = .date
        
      }
    
    

    
    

    
    @IBAction func mondayBtnTapped(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
            if !granted {
                print("Something went wrong")
            } else {
                DispatchQueue.main.async {
                    let monday = self.mBtn.tag
                         
                 let content = UNMutableNotificationContent()

                    content.title = "Time to take your medicane"
                    content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                    content.sound = UNNotificationSound.default
                    let calendar = Calendar.current
                    let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                    var components = DateComponents()
                    components.weekday = monday

              
                    let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    center.removeAllPendingNotificationRequests()
                    center.add(request)
                }
            }
        }
    }
    
    @IBAction func tuesdayBtnTapped(_ sender: Any) {
           let center = UNUserNotificationCenter.current()
           center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
               if !granted {
                   print("Something went wrong")
               } else {
                   DispatchQueue.main.async {
                       
                              let tuesday = self.tBtn.tag
                           
                       
                    let content = UNMutableNotificationContent()

                       content.title = "Time to take your medicane"
                       content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                       content.sound = UNNotificationSound.default
                       let calendar = Calendar.current
                       let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                       var components = DateComponents()
                       components.weekday = tuesday

                 
                       let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                       center.removeAllPendingNotificationRequests()
                       center.add(request)
                   }
               }
           }
       }
    
    @IBAction func wednesdayBtnTapped(_ sender: Any) {
           let center = UNUserNotificationCenter.current()
           center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
               if !granted {
                   print("Something went wrong")
               } else {
                   DispatchQueue.main.async {
                    
                              let wednesday = self.wBtn.tag
                             
                       
                    let content = UNMutableNotificationContent()

                       content.title = "Time to take your medicane"
                       content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                       content.sound = UNNotificationSound.default
                       let calendar = Calendar.current
                       let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                       var components = DateComponents()
                       components.weekday = wednesday

                 
                       let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                       center.removeAllPendingNotificationRequests()
                       center.add(request)
                   }
               }
           }
       }
       
       @IBAction func thursdayBtnTapped(_ sender: Any) {
              let center = UNUserNotificationCenter.current()
              center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
                  if !granted {
                      print("Something went wrong")
                  } else {
                      DispatchQueue.main.async {
                         
                                 let thursday = self.thBtn.tag
                        
                          
                       let content = UNMutableNotificationContent()

                          content.title = "Time to take your medicane"
                          content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                          content.sound = UNNotificationSound.default
                          let calendar = Calendar.current
                          let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                          var components = DateComponents()
                          components.weekday = thursday

                    
                          let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                          let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                          center.removeAllPendingNotificationRequests()
                          center.add(request)
                      }
                  }
              }
          }
          
    @IBAction func fridayBtnTapped(_ sender: Any) {
           let center = UNUserNotificationCenter.current()
           center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
               if !granted {
                   print("Something went wrong")
               } else {
                   DispatchQueue.main.async {
                      
                              let friday = self.fBtn.tag
                           
                       
                    let content = UNMutableNotificationContent()

                       content.title = "Time to take your medicane"
                       content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                       content.sound = UNNotificationSound.default
                       let calendar = Calendar.current
                       let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                       var components = DateComponents()
                       components.weekday = friday

                 
                       let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                       center.removeAllPendingNotificationRequests()
                       center.add(request)
                   }
               }
           }
       }
    
    @IBAction func saturdayBtnTapped(_ sender: Any) {
           let center = UNUserNotificationCenter.current()
           center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
               if !granted {
                   print("Something went wrong")
               } else {
                   DispatchQueue.main.async {
                     
                             
                              let saturday = self.saBtn.tag
                              
                       
                    let content = UNMutableNotificationContent()

                       content.title = "Time to take your medicane"
                       content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                       content.sound = UNNotificationSound.default
                       let calendar = Calendar.current
                       let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                       var components = DateComponents()
                       components.weekday = saturday

                 
                       let trigger = UNCalendarNotificationTrigger(dateMatching: timeComponents, repeats: true)

                       let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                       center.removeAllPendingNotificationRequests()
                       center.add(request)
                   }
               }
           }
       }
       
    @IBAction func sundayBtnTapped(_ sender: Any) {
           let center = UNUserNotificationCenter.current()
           center.requestAuthorization(options: [.badge, .alert, .sound]) { (granted, error) in
               if !granted {
                   print("Something went wrong")
               } else {
                   DispatchQueue.main.async {
                  
                              let sunday = self.suBtn.tag
                       
                    let content = UNMutableNotificationContent()

                       content.title = "Time to take your medicane"
                       content.body = "Time to take your perscription: \(String(describing: self.productNameLbl.text!)), you are scheduled to take \(String(describing: self.productNameLbl.text!)) until \(String(describing: self.endDay.text!))"
                       content.sound = UNNotificationSound.default
                       let calendar = Calendar.current
                       let timeComponents = calendar.dateComponents([.weekday, .hour, .minute], from: self.picker1.date)
                       var components = DateComponents()
                       components.weekday = sunday

                 
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
        timeOfDayTxt.inputAccessoryView = toolbar
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
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)

        guard segue.identifier != "toSearch" else { return }

        let prescription = productNameLbl.text ?? ""
        let ndcNumber = ndcNumberLbl.text ?? ""
        let timeOfDay = timeOfDayTxt.text ?? ""
        let dosageType = dosageTypeLbl.text ?? ""
        let endDate = endDay.text ?? ""
        let imageData = addPhotoButton.backgroundImage(for: .normal)

        pill = Pill(prescription: prescription, ndcNumber: ndcNumber, timeOfDay: timeOfDay,  dosageType: dosageType, endDate: endDate, imageData: imageData?.pngData())
    }

    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        if let packaging = (segue.source as? SearchMedsTableViewController)?.selectedPackaging {
            ndcNumberLbl.text = packaging.product_ndc
            dosageTypeLbl.text = packaging.dosage_form
            productNameLbl.text = packaging.generic_name
            timeOfDayTxt.text = packaging.timeOfDay
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
            
            pill?.imageData = selectedImage.pngData()
            addPhotoButton.imageView?.image = selectedImage
            dismiss(animated: true) {
                self.updateView()
            }
        }
    }
        
}
