//
//  DashboardViewController.swift
//  demoApp
//
//  Created by Ground 2 on 08/04/24.
//

import Foundation
import UIKit

class DashboardViewController : UIViewController{
    
    @IBOutlet var tableViewDashboard: UITableView!
    var listOfStrings = ["a","b","c","d","a","b","c","d","a","b","c","d","a","b","c","d","a","b","c","d","a","b","c","d","a","b","c","d","a","b","c","d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDashboard.dataSource = self
        tableViewDashboard.delegate = self
        
    }
    
}
