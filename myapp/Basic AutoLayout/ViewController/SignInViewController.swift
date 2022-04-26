//
//  SignInViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 29/04/22.
//

import UIKit

class SignInViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    //MARK: - Objc Functions
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - Extention
extension SignInViewController: UITextFieldDelegate {
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
