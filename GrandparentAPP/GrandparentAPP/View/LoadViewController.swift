//
//  LoadViewController.swift
//  GrandparentAPP
//
//  Created by Ella  Neumarker on 1/23/20.
//  Copyright © 2020 Kaden Storrs. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {
    
    let colorTop = UIColor(red: 0.83, green: 0.36, blue: 0.47, alpha: 1.0)
    let colorBottom = UIColor(red:0.43, green:0.34, blue:0.45, alpha:1.0)
       

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)

        // Do any additional setup after loading the view.
    }
}
