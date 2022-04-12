//
//  MVVMViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import UIKit

class MVVMViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var lblmsg: UILabel!
    @IBOutlet weak var tfpassword: UITextField!
    var coordinator: AuthenticationCoordinator?
    var usernameLabel: String?
    let authenticationVM = AuthenticationVM()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindView()
    }
    
    //MARK: - IBActions
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let userName = self.tfEmail.text else {
            return
        }
        guard let password = self.tfpassword.text else {
            return
        }
        self.lblmsg.text = usernameLabel
        authenticationVM.authentication(userName,password: password)
        authenticationVM.loginCompletionHandler {
            [weak self] (status,message) in
            guard let self = self else {
                return
            }
            if status{
                self.coordinator?.goTOSecondVC(strName: "Welcome \(self.tfEmail.text ?? "no")")
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
    
    func bindView() {
        authenticationVM.userName.bind { user in
            guard let user = user else {
                return
            }
            
            self.usernameLabel = user
        }
    }
}
