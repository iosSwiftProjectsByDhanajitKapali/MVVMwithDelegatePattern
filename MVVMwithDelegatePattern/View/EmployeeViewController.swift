//
//  EmployeeViewController.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    @IBOutlet var employeeTableView: UITableView!
    @IBOutlet var sgcDepartment: UISegmentedControl!
    
    let employeeViewModel : EmployeeViewModel = EmployeeViewModel()
    var employeeTableData : EmployeeResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeTableView.dataSource = self
        getEmployeesByDepartment(segmentedControlIndex: 0)
    }
    
    @IBAction func sgcDepartmentDidChangeValue(_ sender: UISegmentedControl) {
        //let segmentedControl = sender as! UISegmentedControl
        getEmployeesByDepartment(segmentedControlIndex: sender.selectedSegmentIndex)
    }
    
}

private extension EmployeeViewController{
    
    func getEmployeesByDepartment(segmentedControlIndex: Int){
        employeeViewModel.getEmployeesByDepartment(departmentIndex: segmentedControlIndex) { (employeeApiResponse) in
            
            if(employeeApiResponse != nil){
                self.employeeTableData = employeeApiResponse
                
                DispatchQueue.main.async {
                    self.employeeTableView.reloadData()
                }
            }else{
                let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: employeeApiResponse?.errorMessage, preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

                self.present(alert, animated: true)
            }
            
        }
    }
    
}
