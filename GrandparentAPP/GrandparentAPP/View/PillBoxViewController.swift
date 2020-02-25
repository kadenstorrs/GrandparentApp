//
//  PillBoxViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillBoxViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//outlets open close & box v
    
    @IBOutlet weak var sundayOpenView: UIView!
    @IBOutlet weak var sundayOpenSubView: UIView!
    @IBOutlet weak var sundayCloseView: UIView!
    @IBOutlet weak var sundayBoxView: UIView!
    
    @IBOutlet weak var mondayOpenView: UIView!
    @IBOutlet weak var mondayOpenSubView: UIView!
    @IBOutlet weak var mondayCloseView: UIView!
    @IBOutlet weak var mondayBoxView: UIView!
    
    @IBOutlet weak var tuesdayOpenView: UIView!
    @IBOutlet weak var tuesdayOpenSubView: UIView!
    @IBOutlet weak var tuesdayCloseView: UIView!
    @IBOutlet weak var tuesdayBoxView: UIView!
    
    @IBOutlet weak var wednesdayOpenView: UIView!
    @IBOutlet weak var wednesdayOpenSubView: UIView!
    @IBOutlet weak var wednesdayCloseView: UIView!
    @IBOutlet weak var wednesdayBoxView: UIView!
    
    @IBOutlet weak var thursdayOpenView: UIView!
    @IBOutlet weak var thursdayOpenSubView: UIView!
    @IBOutlet weak var thursdayCloseView: UIView!
    @IBOutlet weak var thursdayBoxView: UIView!
    
    @IBOutlet weak var fridayOpenView: UIView!
    @IBOutlet weak var fridayOpenSubView: UIView!
    @IBOutlet weak var fridayCloseView: UIView!
    @IBOutlet weak var fridayBoxView: UIView!
    
    @IBOutlet weak var saturdayOpenView: UIView!
    @IBOutlet weak var saturdayOpenSubView: UIView!
    @IBOutlet weak var saturdayCloseView: UIView!
    @IBOutlet weak var saturdayBoxView: UIView!
    
//outlets open close & box ^
    
    @IBOutlet weak var tableView: UITableView!
    
    var pills: [Pills] = PillsController.sharedController.pill
    
    override func viewDidLoad() {
        super.viewDidLoad()

//round corners v
        
        sundayOpenView.layer.cornerRadius = 10
        sundayCloseView.layer.cornerRadius = 10
        sundayOpenSubView.layer.cornerRadius = 10
        
        mondayOpenView.layer.cornerRadius = 10
        mondayCloseView.layer.cornerRadius = 10
        mondayOpenSubView.layer.cornerRadius = 10
        
        tuesdayOpenView.layer.cornerRadius = 10
        tuesdayCloseView.layer.cornerRadius = 10
        tuesdayOpenSubView.layer.cornerRadius = 10
        
        wednesdayOpenView.layer.cornerRadius = 10
        wednesdayCloseView.layer.cornerRadius = 10
        wednesdayOpenSubView.layer.cornerRadius = 10
        
        thursdayOpenView.layer.cornerRadius = 10
        thursdayCloseView.layer.cornerRadius = 10
        thursdayOpenSubView.layer.cornerRadius = 10
        
        fridayOpenView.layer.cornerRadius = 10
        fridayCloseView.layer.cornerRadius = 10
        fridayOpenSubView.layer.cornerRadius = 10
        
        saturdayOpenView.layer.cornerRadius = 10
        saturdayCloseView.layer.cornerRadius = 10
        saturdayOpenSubView.layer.cornerRadius = 10
        
//round corners ^
        
//border color v
        
        sundayBoxView.layer.borderWidth = 2.5
        sundayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        sundayOpenView.layer.borderWidth = 2.5
        sundayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
                
        sundayCloseView.layer.borderWidth = 2.5
        sundayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        
        mondayBoxView.layer.borderWidth = 2.5
        mondayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        mondayOpenView.layer.borderWidth = 2.5
        mondayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        mondayCloseView.layer.borderWidth = 2.5
        mondayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        
        tuesdayBoxView.layer.borderWidth = 2.5
        tuesdayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        tuesdayOpenView.layer.borderWidth = 2.5
        tuesdayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        tuesdayCloseView.layer.borderWidth = 2.5
        tuesdayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        
        wednesdayBoxView.layer.borderWidth = 2.5
        wednesdayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        wednesdayOpenView.layer.borderWidth = 2.5
        wednesdayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        wednesdayCloseView.layer.borderWidth = 2.5
        wednesdayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        
        thursdayBoxView.layer.borderWidth = 2.5
        thursdayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        thursdayOpenView.layer.borderWidth = 2.5
        thursdayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        thursdayCloseView.layer.borderWidth = 2.5
        thursdayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        
        fridayBoxView.layer.borderWidth = 2.5
        fridayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        fridayOpenView.layer.borderWidth = 2.5
        fridayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        fridayCloseView.layer.borderWidth = 2.5
        fridayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        
        saturdayBoxView.layer.borderWidth = 2.5
        saturdayBoxView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        saturdayOpenView.layer.borderWidth = 2.5
        saturdayOpenView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
        saturdayCloseView.layer.borderWidth = 2.5
        saturdayCloseView.layer.borderColor = UIColor(red: 250/255, green: 190/255, blue: 210/255, alpha: 1).cgColor
//border color ^

        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
//action open close v
    
    @IBAction func sundayBoxTapped(_ sender: Any) {
     
      //  sundayCloseView.isHidden = false
        mondayCloseView.isHidden = false
        tuesdayCloseView.isHidden = false
        wednesdayCloseView.isHidden = false
        thursdayCloseView.isHidden = false
        fridayCloseView.isHidden = false
        saturdayCloseView.isHidden = false
        
      //  sundayOpenView.isHidden = true
        mondayOpenView.isHidden = true
        tuesdayOpenView.isHidden = true
        wednesdayOpenView.isHidden = true
        thursdayOpenView.isHidden = true
        fridayOpenView.isHidden = true
        saturdayOpenView.isHidden = true
        
        sundayOpenView.isHidden = !sundayOpenView.isHidden
        sundayCloseView.isHidden = !sundayCloseView.isHidden
    }
    
    @IBAction func mondaydayBoxTapped(_ sender: Any) {
        
        sundayCloseView.isHidden = false
      //  mondayCloseView.isHidden = false
        tuesdayCloseView.isHidden = false
        wednesdayCloseView.isHidden = false
        thursdayCloseView.isHidden = false
        fridayCloseView.isHidden = false
        saturdayCloseView.isHidden = false
        
        sundayOpenView.isHidden = true
      //  mondayOpenView.isHidden = true
        tuesdayOpenView.isHidden = true
        wednesdayOpenView.isHidden = true
        thursdayOpenView.isHidden = true
        fridayOpenView.isHidden = true
        saturdayOpenView.isHidden = true
        
        mondayOpenView.isHidden = !mondayOpenView.isHidden
        mondayCloseView.isHidden = !mondayCloseView.isHidden
    }
    
    @IBAction func tuesdayBoxTapped(_ sender: Any) {
       
        sundayCloseView.isHidden = false
        mondayCloseView.isHidden = false
      // tuesdayCloseView.isHidden = false
        wednesdayCloseView.isHidden = false
        thursdayCloseView.isHidden = false
        fridayCloseView.isHidden = false
        saturdayCloseView.isHidden = false
        sundayOpenView.isHidden = true
        
        mondayOpenView.isHidden = true
      //  tuesdayOpenView.isHidden = true
        wednesdayOpenView.isHidden = true
        thursdayOpenView.isHidden = true
        fridayOpenView.isHidden = true
        saturdayOpenView.isHidden = true
        
        tuesdayOpenView.isHidden = !tuesdayOpenView.isHidden
        tuesdayCloseView.isHidden = !tuesdayCloseView.isHidden
    }
    
    @IBAction func wednesdayBoxTapped(_ sender: Any) {
        
        sundayCloseView.isHidden = false
        mondayCloseView.isHidden = false
        tuesdayCloseView.isHidden = false
      //   wednesdayCloseView.isHidden = false
        thursdayCloseView.isHidden = false
        fridayCloseView.isHidden = false
        saturdayCloseView.isHidden = false
        
        sundayOpenView.isHidden = true
        mondayOpenView.isHidden = true
        tuesdayOpenView.isHidden = true
      //  wednesdayOpenView.isHidden = true
        thursdayOpenView.isHidden = true
        fridayOpenView.isHidden = true
        saturdayOpenView.isHidden = true
        
        wednesdayOpenView.isHidden = !wednesdayOpenView.isHidden
        wednesdayCloseView.isHidden = !wednesdayCloseView.isHidden
    }
    
    @IBAction func thursdayBoxTapped(_ sender: Any) {
        
        sundayCloseView.isHidden = false
        mondayCloseView.isHidden = false
        tuesdayCloseView.isHidden = false
        wednesdayCloseView.isHidden = false
      //  thursdayCloseView.isHidden = false
        fridayCloseView.isHidden = false
        saturdayCloseView.isHidden = false
        
        sundayOpenView.isHidden = true
        mondayOpenView.isHidden = true
        tuesdayOpenView.isHidden = true
        wednesdayOpenView.isHidden = true
      //  thursdayOpenView.isHidden = true
        fridayOpenView.isHidden = true
        saturdayOpenView.isHidden = true
        
        thursdayOpenView.isHidden = !thursdayOpenView.isHidden
        thursdayCloseView.isHidden = !thursdayCloseView.isHidden
    }
    
    @IBAction func fridayBoxTapped(_ sender: Any) {
        
       sundayCloseView.isHidden = false
       mondayCloseView.isHidden = false
       tuesdayCloseView.isHidden = false
       wednesdayCloseView.isHidden = false
       thursdayCloseView.isHidden = false
    //   fridayCloseView.isHidden = false
       saturdayCloseView.isHidden = false
        
        sundayOpenView.isHidden = true
        mondayOpenView.isHidden = true
        tuesdayOpenView.isHidden = true
        wednesdayOpenView.isHidden = true
        thursdayOpenView.isHidden = true
      //  fridayOpenView.isHidden = true
        saturdayOpenView.isHidden = true
        
        fridayOpenView.isHidden = !fridayOpenView.isHidden
        fridayCloseView.isHidden = !fridayCloseView.isHidden
    }
    
    @IBAction func saturdayBoxTapped(_ sender: Any) {
        
        sundayCloseView.isHidden = false
        mondayCloseView.isHidden = false
        tuesdayCloseView.isHidden = false
        wednesdayCloseView.isHidden = false
        thursdayCloseView.isHidden = false
        fridayCloseView.isHidden = false
     //   saturdayCloseView.isHidden = false
        
        sundayOpenView.isHidden = true
        mondayOpenView.isHidden = true
        tuesdayOpenView.isHidden = true
        wednesdayOpenView.isHidden = true
        thursdayOpenView.isHidden = true
        fridayOpenView.isHidden = true
      //  saturdayOpenView.isHidden = true
        
        saturdayOpenView.isHidden = !saturdayOpenView.isHidden
        saturdayCloseView.isHidden = !saturdayCloseView.isHidden
    }
    
//action open close ^
    
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }

    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let pill = pills[indexPath.row]
            Stack.persistantContainer.viewContext.delete(pill)
            pills.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            Stack.saveContext()
        }
    }
    
    
    //MARK: Table View Functionality
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pillboxCell", for: indexPath) as! PillBoxTableViewCell
        
        let pill = pills[indexPath.row]
        
        cell.update(with: pill)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

    
    
    //MARK: Segue
    
    @IBAction func unwindToPillBoxTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! PillDetailViewController
        
        if let pill = sourceViewController.pill {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                pills[selectedIndexPath.row] = pill
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: pills.count, section: 0)
                pills.append(pill)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
       let sourceViewController = segue.source as! PillDetailViewController
        
        if let pill = sourceViewController.pill {
           if let selectedIndexPath = tableView.indexPathForSelectedRow {
               pills[selectedIndexPath.row] = pill
               tableView.reloadRows(at: [selectedIndexPath], with: .none)
           } else {
               let newIndexPath = IndexPath(row: pills.count, section: 0)
               pills.append(pill)
               tableView.insertRows(at: [newIndexPath], with: .automatic)
           }
       }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditPill" {
            let indexPath = tableView.indexPathForSelectedRow!
            let pill = pills[indexPath.row]
            let nextController = segue.destination as! PillDetailViewController
            nextController.pill = pill
        }
    }
}
