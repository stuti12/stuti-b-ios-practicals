//
//  MVVMViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import UIKit

class MVVMViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblmsg: UILabel!
   
    @IBOutlet weak var txtPassword: UITextField!
    var coordinator: AuthenticationCoordinator?
    var usernameLabel: String?
    let authenticationVM = AuthenticationVM()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        bindView()
    }
    
    //MARK: - IBActions
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let userName = self.txtEmail.text else {
            return
        }
        guard let password = self.txtPassword.text else {
            return
        }
        authenticationVM.authentication(userName,password: password)
        authenticationVM.loginCompletionHandler {
            [weak self] (status,message) in
            guard let self = self else {
                return
            }
            if status{
                self.coordinator?.goTOSecondVC(strName: "Welcome \(self.txtEmail.text ?? "no")")
                self.showAlertBox(message: "User Logged in with  userName \n \( String(describing: self.usernameLabel))")
            }
            else {
                self.showAlertBox(message: message)
            }
        }
    }
    
    //MARK: Function
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func bindView() {
        authenticationVM.userName.bind { user in
            guard let user = user else {
                return
            }
            
            self.usernameLabel = user
        }
    }
}

//MARK: Extention
extension MVVMViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtEmail:
            txtEmail.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        case txtPassword:
            txtPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
