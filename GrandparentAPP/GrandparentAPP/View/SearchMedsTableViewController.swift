//
//  SearchMedsTableViewController.swift
//  PillBoxView
//
//  Created by Kaden Storrs on 1/21/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.

import UIKit

class SearchMedsTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedPackaging: Packaging?
    
    var items: [Packaging] = []
    let medController = MedsItemController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    func fetchMedItems() {
        self.items = []
        self.tableView.reloadData()
        let searchTerm = searchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            medController.fetchMedInfo(searchTerm: searchTerm)  { (infoItems) in
                guard let infoItems = infoItems else { return }
                DispatchQueue.main.async {
                    self.items = infoItems
                    self.tableView.reloadData()
                    print(self.items)
                }
            }
        }
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPackaging = items[indexPath.row]
        performSegue(withIdentifier: "unwindDetail", sender: Any.self)
        
    }
    

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as? MedsTableViewCell else { return UITableViewCell() }
        let meds = items[indexPath.row]
        cell.brandNameLbl.text = meds.generic_name
        cell.strengthLbl.text = meds.dosage_form
        cell.productNDCLbl.text = meds.product_ndc
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.shadowRadius = 4
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        tableView.estimatedRowHeight = 50

        return cell
    }
}
extension SearchMedsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchMedItems()
        
        searchBar.resignFirstResponder()
    }
}
