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
    let alertTitle = NSLocalizedString("Password shouldnt empty", comment: "")
    let alertTitleUsername = NSLocalizedString("Username shouldnt empty", comment: "")
    let validCrendential = NSLocalizedString("Please Enter Valid Credential", comment: "")
    
    var user: UserModel?
    func validateData(userName: String,password: String) {
        if userName.count != 0 {
            if password.count != 0 {
                varify(userName: userName, password: password)
            }
            else {
                self.delegate?.showMessage(message: alertTitle)
            }
        }
        else {
            self.delegate?.showMessage(message: alertTitleUsername)
        }
    }
    
    fileprivate func varify(userName: String,password: String) {
        if user?.userName == "test" && password == "123456" {
            self.delegate?.userLoggedIn()
            user = UserModel(userName: "test",email:"test@gmail.com",password:"stuti")
        }
        else {
            self.delegate?.showMessage(message: validCrendential)
        }
    }
    
}
