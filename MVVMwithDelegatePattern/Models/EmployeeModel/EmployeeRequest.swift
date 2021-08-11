//
//  EmployeeRequest.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

@propertyWrapper
struct DepartmentPropertyWrapper {
    private var value : String
    var wrappedValue : String{
        get{
            return value == "0" ? "mobile" : "web"
        }set{
            value = newValue
        }
    }
    init(index: String) {
        value = index
    }
}

struct EmployeeRequest{
    var userId: Int
    @DepartmentPropertyWrapper var department : String
}
