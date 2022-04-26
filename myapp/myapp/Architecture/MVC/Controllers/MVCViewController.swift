//
//  MVCViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 12/04/22.
//

import UIKit

class MVCViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    var coordinator: MVCCoordinator?
    var data: Login?
    let validCrendential = NSLocalizedString("Email address or Password cant be empty", comment: "")
    let invalidCrendential = NSLocalizedString("Email address Invalid", comment: "")
  
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - IBActions
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let userName = self.tfEmail.text else {
            return
        }
        guard let password = self.tfPassword.text else {
            return
        }
        if userName.isEmpty == true || password.isEmpty == true {
            showAlertBox(message: validCrendential)
        }
        else if tfEmail.text!.isValidEmail == false{
            showAlertBox(message: invalidCrendential)
        }
        else {
            data = Login(email: userName, pswd: password)
            showAlertBox(message: "Email: \(data?.email ?? "No data") \n Password:\(data?.pswd ?? "No password")" )
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //MARK: - Functions
    
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - Extention Validation
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: Constants.email, Constants.email2).evaluate(with: self)
    }
}

extension MVCViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfEmail:
            tfEmail.resignFirstResponder()
            tfPassword.becomeFirstResponder()
        case tfPassword:
            tfPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
