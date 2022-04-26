//
//  AuthenticationVM.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import Foundation
class AuthenticationVM {
    var user: User?
    var userName = Dynamic<String?>("default")
    var email : String = ""
    let emptyPassword = NSLocalizedString("Password Empty", comment: "")
    let emptyUserName = NSLocalizedString("Username Empty", comment: "")

    typealias authenticationLoginCallBack = (_ status: Bool, _ message: String)-> Void
    var callback: authenticationLoginCallBack?
    func authentication(_ userName: String, password: String) {
        if userName.count != 0 {
            if password.count != 0 {
                self.userName.value = user?.userName ?? "nil"
                verifyUser(userName, email: user?.email ?? "nil", password: password)
            }
            else {
                self.callback?(false,emptyPassword)
            }
        }
        else {
            self.callback?(false,emptyUserName)
        }
    }
    
    fileprivate func verifyUser(_ userName: String, email: String, password: String){
        if userName == "test" && password == "123456" {
            user = User(userName: userName, email: email)
            self.userName.value = user?.userName
             self.callback?(true,"Succcessfully login")
        }
        else {
            self.callback?(false,"Please enter valid credential")
        }
    }
    
    func loginCompletionHandler(logincallBack: @escaping authenticationLoginCallBack) {
        self.callback = logincallBack
    }
    
}
