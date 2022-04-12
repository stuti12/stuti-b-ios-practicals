//
//  AuthenticationVM.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import Foundation
class AuthenticationVM {
    var user: User?
    var userName: String{return user?.userName ?? "no username"}
    var email: String {
        return user?.email ?? "no email"
    }
    
    typealias authenticationLoginCallBack = (_ status: Bool, _ message: String)-> Void
    var callback: authenticationLoginCallBack?
    func authentication(_ userName: String, password: String) {
        if userName.count != 0 {
            if password.count != 0 {
                verifyUser(userName, password: password)
            }
            else {
                self.callback?(false,"Password cant be empty")
            }
        }
        else {
            self.callback?(false,"Username cant be empty")
        }
    }
    
    fileprivate func verifyUser(_ userName: String, password: String){
        if userName == "test" && password == "123456" {
             user = User(userName: userName, email: "\(userName)@testmail.com")
            self.callback?(true,"Succcessfully login")
        }
        else {
            //invalid
            self.callback?(false,"Please enter valid credential")
        }
    }
    
    func loginCompletionHandler(logincallBack: @escaping authenticationLoginCallBack) {
        self.callback = logincallBack
    }
}
