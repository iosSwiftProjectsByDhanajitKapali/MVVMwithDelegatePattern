//
//  EmployeeViewControllerExtension.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation
import UIKit

extension EmployeeViewController : UITableViewDataSource{
    
    // MARK: - Table view datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeTableData?.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath)

        let name = employeeTableData?.data?[indexPath.row].name
        print(name as Any)
        cell.textLabel!.text = name
        
        return cell
    }
}
