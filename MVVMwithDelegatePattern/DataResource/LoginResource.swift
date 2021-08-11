//
//  LoginResource.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

/*
    This Class is an abstraction layer for the viewModel. Its job is to provide data to the viewModel either from a
    database or from a API call.
*/

import Foundation

struct LoginResource {
    
    ///Use this function to make api calls
    func loginUser(loginRequest: LoginRequest, completion: @escaping( _ result: LoginResponse?)-> Void){
        let loginUrl = URL(string: ApiEndpoints.login)
        do {
            //Gererate the Reuest body for the post api call
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            HttpUtility().postApiData(requestUrl: loginUrl!, requestBody: loginPostBody, resultType: LoginResponse.self) { loginApiResponse in
                _ = completion(loginApiResponse)
            }
        } catch let error {
            debugPrint(error)
        }
    }
        
}



