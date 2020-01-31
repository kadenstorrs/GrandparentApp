//
//  PillBoxViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillBoxViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var pills: [Pill] = [] {
        didSet {
            Pill.saveToFile(pills: pills)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedPills = Pill.loadFromFile() {
            pills = savedPills
        }
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
//        pills.append(Pill(prescription: "Aspirin", ndcNumber: "1233", dosageType: "pill", endDate: "today"))
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pills.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
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
            Pill.saveToFile(pills: pills)
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
           Pill.saveToFile(pills: pills)
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

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
