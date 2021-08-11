//
//  LoginResponse.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

struct LoginResponse : Decodable {

    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable
{
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}
