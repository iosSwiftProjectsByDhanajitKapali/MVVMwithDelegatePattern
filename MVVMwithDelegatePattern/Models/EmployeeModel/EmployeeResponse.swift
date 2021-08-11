//
//  EmployeeResponse.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

struct EmployeeResponse : Decodable{
    let errorMessage: String?
    let data: [Employee]?
}

struct Employee: Decodable {
    let name, email, id: String
    let joining: String

    enum CodingKeys: String, CodingKey {
        case name, email, id, joining
    }
}
