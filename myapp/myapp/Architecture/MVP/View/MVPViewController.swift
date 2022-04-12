//
//  MVPViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 13/04/22.
//

import UIKit

class MVPViewController: UIViewController{
    
    //MARK: IBOUtlet
    private var presenter: LoginPresenter?
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
   
    @IBOutlet weak var lblMessage: UILabel!
    var coordinator: MVPCoordinator?
   
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter()
        presenter?.delegate = self
    }
    
    
    //MARK: IBAction
    
    @IBAction func btnSignUp(_ sender: Any) {
        self.lblMessage.isHidden = true
        
        self.presenter?.validateData(userName:tfName.text ?? "no data",password:tfEmail.text ?? "no data")
    }
}
//MARK: Extention
extension MVPViewController: VCDelegate {
    func showMessage(message: String) {
        self.showAlertBox(message: message)
    }
    
    func userLoggedIn() {
        self.showAlertBox(message: "Logged In Successful")
    }
    
    //MARK: Function
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
