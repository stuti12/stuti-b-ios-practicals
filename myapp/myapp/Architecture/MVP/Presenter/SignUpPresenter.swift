//
//  SignUpPresenter.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import Foundation
protocol VCDelegate {
    func showMessage(message: String)
    func userLoggedIn()
}
class LoginPresenter {
    var delegate: VCDelegate?
    var user: UserModel?
    func validateData(userName: String,password: String) {
        if userName.count != 0 {
            if password.count != 0 {
                varify(userName: userName, password: password)
            }
            else {
                self.delegate?.showMessage(message: "password shouldnt empty")
            }
        }
        else {
            self.delegate?.showMessage(message: "username shouldnt empty")
        }
    }
    
    fileprivate func varify(userName: String,password: String) {
        if userName == "test" && password == "123456" {
            self.delegate?.userLoggedIn()
            user = UserModel(userName: "test",email:"test@gmail.com",password:"stuti")
        }
        else {
            self.delegate?.showMessage(message: "Please enter valid credential")
        }
    }
    
}
