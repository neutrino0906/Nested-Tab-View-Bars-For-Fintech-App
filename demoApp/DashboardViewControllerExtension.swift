//
//  DashboardViewControllerExtension.swift
//  demoApp
//
//  Created by Ground 2 on 09/04/24.
//

import Foundation
import UIKit

extension DashboardViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewDashboard.dequeueReusableCell(withIdentifier: "StringListCell", for: indexPath)
        cell.textLabel?.text = listOfStrings[indexPath.row]
        
        return cell
    }
    
    
}
