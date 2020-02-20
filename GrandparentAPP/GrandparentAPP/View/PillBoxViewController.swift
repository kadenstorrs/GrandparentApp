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
    
    var pills: [Pills] = PillsController.sharedController.pill
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
