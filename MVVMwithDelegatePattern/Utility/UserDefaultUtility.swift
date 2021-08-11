//
//  UserDefaultUtility.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

struct UserDefaultUtility{
    
    func saveUserId(userId: Int){
        UserDefaults.standard.set(userId, forKey: "userId")
    }

    func getUserId() -> Int{
        return UserDefaults.standard.value(forKey: "userId") as! Int
    }
}
