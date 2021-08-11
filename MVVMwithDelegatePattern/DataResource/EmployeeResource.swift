//
//  EmployeeResource.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

struct EmployeeResource{
    
    func getEmployeesByDepartment(employeeRequest: EmployeeRequest, completion: @escaping(_ result : EmployeeResponse?) -> Void){
        let httpUtility = HttpUtility()

        let employeeEndpoint = "\(ApiEndpoints.employees)?Department=\(employeeRequest.department)&UserId=\(employeeRequest.userId)"

        let requestUrl = URL(string:employeeEndpoint)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: EmployeeResponse.self) { (employeeApiResponse) in
            _ = completion(employeeApiResponse)
        }
    }
}
