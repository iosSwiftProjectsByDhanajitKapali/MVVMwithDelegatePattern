//
//  EmployeeViewModel.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

struct EmployeeViewModel {
    func getEmployeesByDepartment(departmentIndex: Int, completion: @escaping(_ result: EmployeeResponse?)-> Void){
        let userID = UserDefaultUtility().getUserId()
        
        //create the EmployeeRequest
        let employeeRequest = EmployeeRequest(userId: userID, department: DepartmentPropertyWrapper(index: "\(departmentIndex)"))
        
        //call the api to get employee resource
        EmployeeResource().getEmployeesByDepartment(employeeRequest: employeeRequest) { employeeApiResponse in
            _ = completion(employeeApiResponse)
        }
    }
}
