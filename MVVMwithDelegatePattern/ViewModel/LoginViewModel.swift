//
//  LoginViewModel.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import Foundation

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel{
    var delegate : LoginViewModelDelegate?
    
    func loginUser(loginRequest : LoginRequest) {
        
        //validate the LoginRequest
        let validationResult = LoginValidation().validate(loginRequest: loginRequest)
        
        if validationResult.isValidationSucess{
            //use LoginResource to call login api
            LoginResource().loginUser(loginRequest: loginRequest) { loginApiResponse in
                
                //save the userID to userdefaults
                if(loginApiResponse?.errorMessage == nil && loginApiResponse?.data != nil){
                    UserDefaultUtility().saveUserId(userId: loginApiResponse!.data!.userID)
                }
                //pass the response to the view
                DispatchQueue.main.async {
                    self.delegate?.didReceiveLoginResponse(loginResponse: loginApiResponse)
                }
            }
        }else{  //if validation fails
            self.delegate?.didReceiveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.validationError, data: nil))
        }
    }
}
