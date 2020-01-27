//
//  PillDetailViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class PillDetailViewController: UIViewController {
    @IBOutlet weak var ndcNumberLbl: UITextField!
    @IBOutlet weak var dosageTypeLbl: UITextField!
    @IBOutlet weak var endDateLbl: UITextField!
    @IBOutlet weak var productNameLbl: UITextField!
    
    @IBOutlet weak var circularImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = circularImage.bounds.width / 2
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
           if let packaging = (segue.source as? SearchMedsTableViewController)?.selectedPackaging {
            ndcNumberLbl.text = packaging.product_ndc
            dosageTypeLbl.text = packaging.dosage_form
            productNameLbl.text = packaging.generic_name
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