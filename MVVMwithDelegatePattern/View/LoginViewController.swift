//
//  ViewController.swift
//  MVVMwithDelegatePattern
//
//  Created by unthinkable-mac-0025 on 11/08/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    

    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the delegate of the ViewModel with self
        loginViewModel.delegate = self
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //creat the LoginRequest from input data
        let request = LoginRequest(userEmail: userName.text, userPassword: password.text)
        loginViewModel.loginUser(loginRequest: request)
    }
    
}

extension LoginViewController: LoginViewModelDelegate{
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        if(loginResponse?.errorMessage == nil && loginResponse?.data != nil){
            debugPrint("Navigate to different view controller")
        }else if(loginResponse?.errorMessage != nil){
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: loginResponse?.errorMessage, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

            self.present(alert, animated: true)
        }
    }
}
