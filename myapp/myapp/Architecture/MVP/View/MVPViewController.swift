//
//  MVPViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import UIKit

class MVPViewController: UIViewController{
    
    //MARK: - IBOUtlet
    private var presenter: LoginPresenter?
   
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    var coordinator: MVPCoordinator?
    let validCrendential = NSLocalizedString("Login Successful", comment: "")
  
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter()
        presenter?.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - IBAction
    
    @IBAction func btnSignUp(_ sender: Any) {
        self.lblMessage.isHidden = true
        
        self.presenter?.validateData(userName:tfEmail.text ?? "no data",password:tfEmail.text ?? "no data")
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
//MARK: - Extention
extension MVPViewController: VCDelegate {
    func showMessage(message: String) {
        self.showAlertBox(message: message)
    }
    
    func userLoggedIn() {
        self.showAlertBox(message: validCrendential)
    }
    
    //MARK: Function
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
//MARK: - Extention
extension MVPViewController: UITextFieldDelegate{
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
