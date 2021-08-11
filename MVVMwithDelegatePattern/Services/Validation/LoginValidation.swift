//
//  LoginValidation.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

struct LoginValidation{
    
    ///Use this function to validate the LoginRequest
    func validate(loginRequest: LoginRequest) -> ValidationResult {
        
        if(loginRequest.userEmail!.isEmpty){
            return ValidationResult(isValidationSucess: false, validationError: "User email is empty")
        }
        
        if(loginRequest.userPassword!.isEmpty){
            return ValidationResult(isValidationSucess: false, validationError: "User password is empty")
        }
        
        return ValidationResult(isValidationSucess: true, validationError: nil)
    }
}
